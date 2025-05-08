const VAL: Int = pow(10, 3) + pow2(4);  // 10^3 + 2^4 = 1000 + 16 = 1016

contract Test {
    get fun getVal(): Int {
        return VAL;
    }
}
