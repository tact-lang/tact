fun test_try_catch() {
    try {
        throw(101);
    } catch (code) {
        dump(code);
    }
}

fun test_nested_try() {
    try {
        try {
            throw(7);
        } catch (x) {
            dump(x);
            throw(x + 1);
        }
    } catch (y) {
        dump(y);
    }
}

fun test_ternary() {
    dump((1 < 2) ? 100 : 200);
}

fun test_empty_if() {
    if (false) {}
    dump(2);
}

fun test_nested_if() {
    if (2 + 2 == 5) {
        dump(1);
    } else if (2 + 3 == 5) {
        dump(2);
    } else {
        dump(3);
    }
}
