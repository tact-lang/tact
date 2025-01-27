const A: Int = C;
const C: Int = A;

contract Test {
    get fun getConstant(): Int {
        return C;
    }
}
