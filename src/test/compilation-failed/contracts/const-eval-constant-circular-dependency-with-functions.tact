const A: Int = foo();
const C: Int = A;

fun foo(): Int {
    return bar()
}

fun bar(): Int {
    return baz()
}

fun baz(): Int {
    return C
}

contract Test {
    get fun getConstant(): Int {
        return C;
    }
}
