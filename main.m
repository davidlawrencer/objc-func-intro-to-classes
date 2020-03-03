//
//  main.m
//  objc-functions-blocks-intro-classes
//
//  Created by David Rifkin on 3/3/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

#import <Foundation/Foundation.h>



//Creating objects!
// what are the two types of files our objc program will use
// .h (header file) .m (objective-c file)
// .h had interface, .m usually has the implementation.
// that's convention though (header encapsulates)

// Caps to show we're creating a new type
// interface DEMANDS that it inherit from a superclass.
// Must at least subclass frmo NSObject so we can allocate/initialize - root/highest/base/just inherit from it

// @ indicates a directive when it's outside the scope of a function/class
@interface Cat : NSObject
// instance method that doesn't take any arguments and doesn't return anything
- (void)sound;

// class method uses + in front of the signature. [Cat howMany]
@end

//main is the name of a function that returns an int and has an int argument argc (argument count) and array argv (argument values/variables)
// function format is:
// returnType nameOfFunction(typeOf argument1, typeOf argument2...)

// Swift functions provide us with values, but Objc functions' arguments can give us references.

// Let's make a simple function. Function that takes in an int, and then counts up from 1 to that int, and adds each value to an array, and then returns the count of that array.

//We can set up the signature for the function without implementing it. I can declare it here, and then set up the implementation elsewhere. Important because it needs to be declared before use
 int takeInAnIntAndReturnAnInt(int count);

// Is this an instance method? NO
// Is not a class method (what we usually call "static" in Swift)?
// What's the scope of this function? Global. Not specific to how we use OOP.
int takeInAnIntAndReturnAnInt(int count) {
    return count;
}

//Control reaches non-void function -> we're not returning the right type

// argv is a const because it's a pointer to where the array of chars is saved, but we don't want anyone to be able to change the value of it. We'll often do this if we don't want references/objects to be changed by the encapsulating code in the function.
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create an array containing all numbers between 1 and argc. Print the count of the number of elements in that array.
        
        //First - create an array for our numbers. Must be mutable so we can keep appending to it. NSArray is static type, NSMutableArray is dynamic type.
        //Reminder: Asterisk indicates that we have a pointer to an object
        // In Swift, first declare: var array:[Int]
        // Then initialize: array = Array<Int>()
        NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
        
        //Then, loop through starting at 1 until we've reached the int value of argc. In each iteration of the loop, append i to the mutable array
        
        for (int i = 1; i <= argc; i++) {
            //when we append to our array, we send a message 🔪🔪🔪🔪🔪
            //this looks at array and adds i as NSString using literal notation.
            [mutableArray addObject:(@"i")];
        }
        
        //Reminder, Objc does not have interpolation. We use these flags or tokens
        // In Swift, we could get the number of items using array.count
        NSLog(@"There are %lu items in this array", [mutableArray count]);
        NSLog(@"Argc has %d argument", takeInAnIntAndReturnAnInt(argc));
        
        //If there is one item in the array, how many arguments are there in the main function
        
        //What does this line do? It returns an int
        takeInAnIntAndReturnAnInt(argc);
        
        //We have a cat! The interface must be available before use, but the implementation does not need to be.
        // [Cat new] is the same as [[Cat alloc] init]
        Cat *myCat = [Cat new];
        [myCat sound];
        /*
         We can add command line arguments by using the CLANG compiler
         Most programs work like this
         */
        
    }
    return 0;
}

// implementation directive
//Don't need to indicate any inheritance (don't need to know about superclasses here).
@implementation Cat

// If we create the interface, then we'll know exactly how to implement it. We get a warning from the program to let us know if the interface hasn't been implemented in its entirety
- (void)sound {
    NSLog(@"meow");
}
@end

/*
Next time:
 define our inits so we can add properties
 see how we use blocks (aka closures)
 talk through importing header files (code organization)
 inheritance with more and more objects.
 */
