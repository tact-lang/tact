struct Many { one: Int; two: Int; three: Int; fans: Int }

fun test_ignore(s: Many) {
    let Many { fans, .. } = s;
    dump(fans);
}

fun test_operator_precedence() {
    let a = 1 + 2 * 3 - 4 / 2; // Expected: 5
    dump(a);
}

fun test_negative_literal() {
    let x = -5 * 3; // Expected: -15
    dump(x);
}

fun test_logical_precedence() {
    let b = true || false && false; // Expected: true
    if (b) { dump(1); } else { dump(0); }
}

fun test_repeat_skip() {
    let sum = 0;
    repeat (-5) { sum += 10; }
    dump(sum); // Expected: 0
}

fun test_repeat_zero() {
    let sum = 0;
    repeat (0) { sum += 10; }
    dump(sum); // Expected: 0
}

fun test_while_loop() {
    let x: Int = 0;
    while (x < 3) { x += 1; }
    dump(x); // Expected: 3
}

fun test_do_until() {
    let x: Int = 1;
    do { x *= 2; } until (x > 10);
    dump(x); // Expected: 16
}

fun test_foreach() {
    let m: map<Int, Int> = emptyMap();
    m.set(2, 5);
    m.set(3, 7);
    let sum: Int = 0;
    foreach (key, value in m) { sum += key + value; }
    dump(sum); // Expected: 17
}

fun test_throwIf_success() {
    throwIf(42, false);
    dump(0);
}

fun test_throwIf_throw() {
    try {
         throwIf(42, true);
    } catch (c) {
         dump(c); // Expected: 42
    }
}

fun test_throw_invalid(flag: Bool) {
    try {
         if (flag) { throw(70000); } else { dump(0); }
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
         dump(c); // Expected: 101
    }
}

fun test_do_until_once() {
    let x: Int = 10;
    do { x = 999; } until (x < 10);
    dump(x); // Expected: 999
}

fun test_throw_negative() {
    try {
         throw(-5);
    } catch (c) {
         dump(c); // Expected: -5
    }
}

fun test_throw_boundary_low() {
    try {
         throw(0);
    } catch (c) {
         dump(c); // Expected: 0
    }
}

fun test_throw_boundary_high() {
    try {
         throw(65535);
    } catch (c) {
         dump(c); // Expected: 65535
    }
}

fun test_nested_loop_try() {
    let count = 0;
    repeat (3) {
        try {
            if (count == 1) { throw(123); }
            count += 10;
        } catch (code) { count += code; }
    }
    dump(count);
}

fun test_misc_arithmetic() {
    let result = -(-5) + 3 * (2 + 1);
    dump(result);
}

fun main() {
    test_ignore(Many { one: 1, two: 2, three: 3, fans: 42 });
    test_operator_precedence();
    test_negative_literal();
    test_logical_precedence();
    test_repeat_skip();
    test_repeat_zero();
    test_while_loop();
    test_do_until();
    test_foreach();
    test_throwIf_success();
    test_throwIf_throw();
    test_throw_invalid(true);
    test_throw_invalid(false);
    test_throwUnless_success();
    test_throwUnless_throw();
    test_do_until_once();
    test_throw_negative();
    test_throw_boundary_low();
    test_throw_boundary_high();
    test_nested_loop_try();
    test_misc_arithmetic();
    dump("Fuzz testing complete");
}
