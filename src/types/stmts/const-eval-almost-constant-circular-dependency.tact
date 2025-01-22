primitive Int;

const A: Int = B;
const B: Int = foo(1);

fun foo(v: Int): Int {
    if (v == 1) {
        return 0;
    } else {
        return A; // The else never executes, so no circular dependence at compile-time
    }
}

fun foo2(v: Int): Int {
    if (v == 1) {
        return 0;
    }

    return A; // This code is never executed, so no circular dependence at compile-time
}
