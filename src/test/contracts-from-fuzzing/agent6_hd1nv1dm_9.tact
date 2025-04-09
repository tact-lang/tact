fun test_repeat_skip() {
    let sum = 0;
    repeat (-5) {
       sum += 10;
    }
    dump(sum);
}

fun test_while_loop() {
    let x: Int = 0;
    while (x < 3) {
       x += 1;
    }
    dump(x);
}

fun test_do_until() {
    let x: Int = 1;
    do {
       x *= 2;
    } until (x > 10);
    dump(x);
}

fun test_foreach() {
    let m: map<Int, Int> = emptyMap();
    m.set(2, 5);
    m.set(3, 7);
    let sum: Int = 0;
    foreach (key, value in m) {
       sum += key + value;
    }
    dump(sum);
}

fun test_throwIf_success() {
    throwIf(42, false);
    dump(0);
}

fun test_throwIf_throw() {
    try {
         throwIf(42, true);
         // The following statement is unreachable if throwIf throws
         dump(1000);
    } catch (c) {
         dump(c);
    }
}

// Adjusted test_throw_invalid to avoid unreachable statement error:
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
         dump(c);
    }
}

fun test_do_until_once() {
    let x: Int = 10;
    do {
       x = 999;
    } until (x < 10);
    dump(x);
}
