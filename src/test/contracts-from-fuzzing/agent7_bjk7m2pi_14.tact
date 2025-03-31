///////////////////////////////////////////////////////////////////
// Extended Fuzz Testing Cycle Continued: Additional Compiler Features
// This snippet tests the following features:
// 1. Repeat loop with zero count (should execute 0 times)
// 2. While loop with an initially false condition
// 3. Struct conversion to a Cell and back
///////////////////////////////////////////////////////////////////

// Test 1: Repeat loop with count 0
fun testRepeatZero() {
    let acc: Int = 0;
    repeat (0) {
        acc = acc + 1;
    }
    dump(acc); // expected output: 0
}

// Test 2: While loop with a false condition initially
fun testWhileFalse() {
    let x: Int = 10;
    while (x < 0) {
        x = x - 1;
    }
    dump(x); // expected output: 10
}

// Test 3: Struct conversion to Cell and back
struct S {
    a: Int;
    b: Int;
}

fun testStructToCell() {
    let s0: S = S{ a: 42, b: 100 };
    let cell0: Cell = s0.toCell();
    let s1: S = S.fromCell(cell0);
    dump(s1.a + s1.b); // expected output: 142
}

// Main function to execute all tests
fun main() {
    testRepeatZero();
    testWhileFalse();
    testStructToCell();
}
