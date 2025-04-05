const ARITH_CONST: Int = 10 * 2 + 5 - 3; // expected value: 22

contract Test {
    get fun getConst(): Int {
         return ARITH_CONST;
    }
}
