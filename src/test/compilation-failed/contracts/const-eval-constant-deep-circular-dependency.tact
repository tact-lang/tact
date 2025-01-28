const A: Int = E;
const B: Int = A;
const C: Int = B;
const D: Int = C;
const E: Int = D;

contract Test {
    get fun getConstant(): Int {
        return E;
    }
}
