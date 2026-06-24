fun test_log_valid(): Int {
    // Valid: log(1000, 10) should return 3 because 10^3 = 1000
    return log(1000, 10);
}

fun test_log_invalid(): Int {
    // Invalid log: num <= 0, should throw an error with exit code 5
    try {
        return log(0, 10);
    } catch (exitCode) {
        return exitCode;
    }
}

fun test_mulShiftRightRound(): Int {
    // Expected: rounding to nearest; for (5*5)/2^2, normally 25/4=6.25 rounds to 6
    return mulShiftRightRound(5, 5, 2);
}

fun test_mulShiftRightCeil(): Int {
    // Expected: ceiling of (5*5)/2^2; 25/4=6.25 -> ceil is 7
    return mulShiftRightCeil(5, 5, 2);
}

fun test_repeat_zero(): Int {
    let sum: Int = 42;
    // repeat with 0 iterations: block should not execute
    repeat (0) {
         sum = sum + 100;
    }
    return sum; // expected 42
}

fun test_repeat_negative(): Int {
    let sum: Int = 5;
    // Negative repeat count: should not execute loop
    repeat (-10) {
         sum = sum * 2;
    }
    return sum; // expected 5
}

fun test_repeat_range(): Int {
    // The repeat loop expects a number in [1, 2^31 - 1]. Using a too large count should cause an error
    try {
       repeat (pow(2, 33)) {
           // empty loop body
       }
       return 999; // should not reach here
    } catch (exitCode) {
       return exitCode; // expected exit code 5
    }
}

fun test_foreach(): Int {
    // Create a map, set keys in non-sorted order and sum the keys
    let m: map<Int, Int> = emptyMap();
    m.set(3, 100);
    m.set(1, 50);
    m.set(2, 75);
    let s: Int = 0;
    foreach (k, v in m) {
       s = s + k;
    }
    return s; // expected: 1 + 2 + 3 = 6
}

fun test_while(): Int {
    let x: Int = 5;
    while (x > 0) {
       x = x - 1;
    }
    return x; // expected 0
}

fun test_do_until(): Int {
    let x: Int = 5;
    do {
       x = x - 1;
    } until (x == 0);
    return x; // expected 0
}

fun test_if_else(): Int {
    if (10 < 20) {
        return 1;
    } else {
        return 2;
    }
}

fun test_throwIf(): Int {
    // throwIf should throw only when condition is true
    try {
       throwIf(123, false); // does nothing
       throwIf(234, true);  // should throw exit code 234
       return 0;
    } catch (exitCode) {
       return exitCode;
    }
}

fun test_throwUnless(): Int {
    // throwUnless should throw only when condition is false
    try {
       throwUnless(345, true);  // does nothing
       throwUnless(456, false); // should throw exit code 456
       return 0;
    } catch (exitCode) {
       return exitCode;
    }
}

fun main() {
    let r1 = test_log_valid();
    let r2 = test_log_invalid();
    let r3 = test_mulShiftRightRound();
    let r4 = test_mulShiftRightCeil();
    let r5 = test_repeat_zero();
    let r6 = test_repeat_negative();
    let r7 = test_repeat_range();
    let r8 = test_foreach();
    let r9 = test_while();
    let r10 = test_do_until();
    let r11 = test_if_else();
    let r12 = test_throwIf();
    let r13 = test_throwUnless();

    dump(r1);
    dump(r2);
    dump(r3);
    dump(r4);
    dump(r5);
    dump(r6);
    dump(r7);
    dump(r8);
    dump(r9);
    dump(r10);
    dump(r11);
    dump(r12);
    dump(r13);
}
