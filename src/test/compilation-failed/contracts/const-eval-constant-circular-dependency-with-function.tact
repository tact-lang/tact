const A: Int = foo();
const C: Int = A;

fun foo(): Int {
    return C;
}

contract Test {
    get fun getConstant(): Int {
        return C;
    }
}
