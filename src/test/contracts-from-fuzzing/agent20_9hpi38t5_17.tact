struct Inner { a: Int; b: Int }
struct Outer { inner: Inner; label: String }

fun destructNestedTest(): Int {
    // Destructuring assignment with nested structures: split into two steps
    let Outer { inner, label } = Outer { inner: Inner { a: 10, b: 5 }, label: "test" };
    let Inner { a, b } = inner;
    return a * b; // expected result: 10 * 5 = 50
}

fun fixedShadowingTest(): Int {
    // Instead of variable shadowing (which Tact disallows), use a different variable name in the inner block
    let val1 = 10;
    {
         let innerVal = 20;
         dump(innerVal); // expected dump: 20
    }
    dump(val1); // expected dump: 10
    return val1;
}

fun wildCardTest(): Int {
    // Declare a variable with a wildcard name; its value cannot be accessed
    let _ : Int = 100;
    return 123;
}

fun tryNoCatchTest(x: Int): Int {
    // Try block without a catch clause; if x == 0, division by zero error would be thrown
    let r: Int = 0;
    try {
         r = 100 / x; // if x is 0, this would raise an error. For non-zero x it works fine.
    }
    return r;
}

inline fun inlineTest(a: Int): Int {
    return a * 2;
}

fun arithmeticTest(): Int {
    // Test operator precedence and ternary operator
    let result = (2 + 3 * 4) - 5; // expected: 2 + 12 - 5 = 9
    return (result > 5) ? result : 0;
}

fun main() {
    dump(destructNestedTest());   // Expected output: 50
    dump(fixedShadowingTest());     // Expected dump: 20 and then 10, returns 10
    dump(tryNoCatchTest(10));       // Expected output: 10
    dump(wildCardTest());           // Expected output: 123
    dump(inlineTest(21));           // Expected output: 42
    dump(arithmeticTest());         // Expected output: 9
}
