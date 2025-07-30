fun test_if_else(x: Int): Int {
    if (x > 10) {
        return 100;
    } else if (x == 10) {
        return 50;
    } else {
        return 0;
    }
}

fun test_ternary(x: Int): Int {
    return x > 5 ? (x * 2) : (x * 3);
}

fun test_try_catch(x: Int): Int {
    try {
        if (x == 0) {
            throw(123);
        }
        return 10 / x;
    } catch (err) {
        return err;
    }
}

fun main() {
    dump(test_if_else(9));   // expected 0
    dump(test_if_else(10));  // expected 50
    dump(test_if_else(11));  // expected 100

    dump(test_ternary(4));   // expected 12
    dump(test_ternary(6));   // expected 12

    dump(test_try_catch(0)); // expected 123 (due to thrown error)
    dump(test_try_catch(5)); // expected 2
}
