/// Fuzz Test Suite: Return Statement Behavior in Tact

// Test 1: Regular function with a simple return
fun test1(): Int {
    return 1;
}

// Test 2: Return from inside a nested block based on a parameter
fun test2(x: Int): Int {
    {
        if (x > 0) {
            return 2;
        }
    }
    return 0;
}

// Test 3: Conditional early return based on an argument
fun test3(x: Int): Int {
    if (x > 10) {
        return 10;
    } else {
        return -1;
    }
}

// Test 4: Return inside a loop block using 'repeat'
fun test4(n: Int): Int {
    repeat(n) {
        if (n > 5) {
            return n;
        }
    }
    return 0;
}

// Test 5: Mismatched return type example (expected compile error) - commented out
/*
fun test5(x: Bool): Int {
    if (x) { return 1; }
    return false; // ERROR: returning Bool instead of Int
}
*/

// Test 6: Function with no return value (implicitly unit)
fun test6() {
    return;
}

// Test 7: Getter function in a contract returning a primitive value, with field initialization
contract Test7 {
    v: Int = 0;

    // Minimal receive to satisfy contract requirements
    receive() {}

    get fun getVal(): Int {
        return self.v;
    }
}

// Test 8: Receiver with an explicit return (no return value expected)
contract Test8 {
    receive() {
        return;
    }
}

// Test 9: Function returning an optional Int
fun test9(): Int? {
    if (true) { return 1; }
    return null;
}

// Test 10: Return with parentheses
fun test10(): Int {
    return (1);
}

// Test 11: Function returning a string
fun test11(): String {
    return "hello";
}
