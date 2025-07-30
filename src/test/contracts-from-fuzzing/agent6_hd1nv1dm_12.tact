fun test_repeat_skip() {
    let sum = 0;
    // Negative repeat values cause the block to be skipped
    repeat (-5) {
       sum += 10;
    }
    dump(sum); // Expected 0
}

fun test_repeat_zero() {
    let sum = 0;
    repeat (0) {
       sum += 10;
    }
    dump(sum); // Expected 0
}

fun test_while_loop() {
    let x: Int = 0;
    while (x < 3) {
       x += 1;
    }
    dump(x); // Expected 3
}

fun test_do_until() {
    let x: Int = 1;
    do {
       x *= 2;
    } until (x > 10);
    dump(x); // Expected 16
}

fun test_foreach() {
    let m: map<Int, Int> = emptyMap();
    m.set(2, 5);
    m.set(3, 7);
    let sum: Int = 0;
    foreach (key, value in m) {
       sum += key + value;
    }
    dump(sum); // Expected (2+5)+(3+7)=17
}

fun test_throwIf_success() {
    throwIf(42, false);
    dump(0);
}

fun test_throwIf_throw() {
    try {
         throwIf(42, true);
         // This statement is logically unreachable
         dump(1000);
    } catch (c) {
         dump(c); // Expected 42
    }
}

fun test_throw_invalid(flag: Bool) {
    try {
         if (flag) {
             throw(70000);
         } else {
             dump(0);
         }
         dump(9999);
    } catch (c) {
         dump(c);
    }
}

fun test_throwUnless_success() {
    throwUnless(101, false);
    dump("no throw");
}

fun test_throwUnless_throw() {
    try {
         throwUnless(101, true);
         dump("should not execute");
    } catch (c) {
         dump(c); // Expected 101
    }
}

fun test_do_until_once() {
    let x: Int = 10;
    do {
       x = 999;
    } until (x < 10);
    dump(x); // Expected 999 because loop executes once
}

fun test_throw_negative() {
    try {
         throw(-5);
         // Unreachable
    } catch (c) {
         dump(c); // Expected -5
    }
}

fun test_throw_boundary_low() {
    try {
         throw(0);
    } catch (c) {
         dump(c); // Expected 0
    }
}

fun test_throw_boundary_high() {
    try {
         throw(65535);
    } catch (c) {
         dump(c); // Expected 65535
    }
}

fun test_nested_loop_try() {
    let count = 0;
    repeat (3) {
        try {
            if (count == 1) {
                throw(123);
            }
            count += 10;
        } catch (code) {
            count += code;
        }
    }
    dump(count);
}

fun main() {
    test_repeat_skip();      // Expected: 0
    test_repeat_zero();      // Expected: 0
    test_while_loop();       // Expected: 3
    test_do_until();         // Expected: 16
    test_foreach();          // Expected: 17
    test_throwIf_success();  // Expected: 0
    test_throwIf_throw();    // Expected: 42
    test_throw_invalid(true); // should catch error for 70000
    test_throw_invalid(false); // Expected: 0
    test_throwUnless_success(); // Expected: "no throw"
    test_throwUnless_throw();   // Expected: 101
    test_do_until_once();    // Expected: 999
    test_throw_negative();   // Expected: -5
    test_throw_boundary_low(); // Expected: 0
    test_throw_boundary_high(); // Expected: 65535
    test_nested_loop_try();  // Expected: depends on runtime logic
}
