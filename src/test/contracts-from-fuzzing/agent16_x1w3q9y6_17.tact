fun testDoUntil(): Int {
    let x: Int = 10;
    do {
        x = x - 1;
    } until (x <= 0);
    return x;
}

fun mapIterationTest(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(5, 50);
    m.set(6, 60);
    // We'll accumulate the sum in an auxiliary mutable variable
    // In Tact, let bindings can be re-assigned in loops
    let sum: Int = 0;
    foreach (k, v in m) {
        sum = sum + v;
    }
    return sum;
}

fun blockScopingTest(): Int {
    let a: Int = 5;
    {
        let b: Int = a * 2; // expected 10; b is local
        dump(b);
    }
    return a;
}

fun ifElseTest(x: Int): Int {
    if (x > 0) {
        return x;
    } else {
        return -x;
    }
}

fun main(): Int {
    let d: Int = testDoUntil();      // Expected: 0
    let e: Int = mapIterationTest();   // Expected: 50 + 60 = 110
    let f: Int = blockScopingTest();   // Expected: 5, and dump should show 10
    let g: Int = ifElseTest(-10);        // Expected: 10
    let total: Int = d + e + f + g;      // Expected: 0 + 110 + 5 + 10 = 125
    dump(total);
    return total;
}
