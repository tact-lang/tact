fun testRepeat() : Int {
    let result: Int = 1;
    repeat (10) {
        result *= 2;
    }
    return result;
}

fun testWhile() : Int {
    let x: Int = 10;
    while (x > 0) {
        x -= 1;
    }
    return x;
}

fun testDoUntil() : Int {
    let x: Int = 10;
    do {
        x -= 1;
    } until (x == 0);
    return x;
}

fun testForeach() : Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    let sum: Int = 0;
    foreach (key, value in m) {
        sum += value;
    }
    return sum;
}

fun testTryCatchThrowIf() : Int {
    try {
        throwIf(123, true);
        return 0; // unreachable
    } catch (e) {
        return e; // expected: 123
    }
}

fun testNestedTry() : Int {
    try {
        try {
            throw(200);
        } catch (_) {
            throw(300);
        }
    } catch (err) {
        return err; // expected: 300
    }
}

fun main() : Int {
    let r1: Int = testRepeat();        // Expected: 1024
    let r2: Int = testWhile();           // Expected: 0
    let r3: Int = testDoUntil();         // Expected: 0
    let r4: Int = testForeach();         // Expected: 30
    let r5: Int = testTryCatchThrowIf(); // Expected: 123
    let r6: Int = testNestedTry();       // Expected: 300
    return r1 + r2 + r3 + r4 + r5 + r6;   // Expected sum: 1477
}
