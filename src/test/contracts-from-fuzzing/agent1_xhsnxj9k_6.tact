/* Testing loop constructs in Tact: repeat, while, do...until, and handling negative repeat values.
   This snippet follows the documentation examples in Tact statements (see ).
   Note: Tact uses local variables declared with let that are mutable (as shown in the documentation, e.g. x -= 1 in while loops).
*/

fun testLoops(): Int {
    // Initialize a mutable counter; reassignments are allowed as shown in documentation examples
    let counter: Int = 0;

    // Repeat loop: should execute exactly 3 times, incrementing counter on each iteration
    repeat (3) {
        // Reassign counter by adding 1
        counter = counter + 1;
    }
    // While loop: while counter is less than 6, increment it until reaching 6
    while (counter < 6) {
        counter = counter + 1;
    }
    // do...until loop: decrement counter until it equals 3; loop executes at least once
    do {
        counter = counter - 1;
    } until (counter == 3);

    return counter; // Expected to be 3
}

fun negativeRepeatTest(): Int {
    let value: Int = 5;
    // Negative repeat value: the block should be skipped entirely
    repeat (-1) {
        value = value + 100; // should not execute
    }
    return value; // Expected to be 5
}

fun main(): Int {
    let a = testLoops();         // expected 3
    let b = negativeRepeatTest();  // expected 5
    return a + b;                  // expected 3 + 5 = 8
}
