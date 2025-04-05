const CONST_B: Bool = true;

contract Test {
    get fun testIf(): Int {
        return CONST_B ? 1 : 2;
    }
}
