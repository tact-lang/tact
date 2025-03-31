struct Many { one: Int; two: Int; three: Int; fans: Int; }

// Assembly function: adds two integers
asm fun add(x: Int, y: Int): Int { x y ADD }

// Test repeat loop behavior, including negative count (which should be skipped) and a valid positive iteration
fun testRepeat(): Int {
    let c: Int = 0;
    // Negative repeat - should be skipped
    repeat (-5) { 0; }
    let d: Int = c;
    repeat (3) {
        d = d + 2;
    }
    return d;
}

// Test try...catch behavior: throw an exit code and catch it, then modify the caught value
fun tryCatchTest(): Int {
    try {
        throw(101);
    } catch (err) {
        return err + 1;
    }
}

// Test destructuring assignment with the '..' pattern to ignore extra fields
fun ignoreTest(): Int {
    let Many { fans, .. } = Many { one: 1, two: 2, three: 3, fans: 100 };
    return fans;
}

// Test a while loop that sums numbers from 1 to 10
fun testWhile(): Int {
    let x: Int = 10;
    let s: Int = 0;
    while (x > 0) {
        s = s + x;
        x = x - 1;
    }
    return s;
}

// Test assembly function: should compute add(40,2) = 42
fun testAssembly(): Int {
    let r: Int = add(40, 2);
    return r;
}

// Main function aggregates results from tests
fun main(): Int {
    let a: Int = testRepeat();      // Expected: 0 + 3*2 = 6
    let b: Int = tryCatchTest();      // Expected: 101+1 = 102
    let c: Int = ignoreTest();        // Expected: 100
    let d: Int = testWhile();         // Expected sum of 10+9+...+1 = 55
    let e: Int = testAssembly();      // Expected: 42

    dump(a);
    dump(b);
    dump(c);
    dump(d);
    dump(e);

    return a + b + c + d + e;         // Expected: 6 + 102 + 100 + 55 + 42 = 305
}
