primitive Int;

fun test(v: Int): Int {
    let a: Int? = null;
    let b: Int? = null;

    if (a == null) {
        a = 10;
    } else {
        b = 5;       // This assignment is ignored because condition is true
    }

    a!!;             // OK
    return b!!;      // Null dereference
}