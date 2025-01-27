const A: Int = foo(20);
const C: Int = A;

fun foo(value: Int): Int {
    if (value > 1) {
        return foo(value - 1)
    }
    return C;
}

contract Test {
    get fun getConstant(): Int {
        return C;
    }
}
