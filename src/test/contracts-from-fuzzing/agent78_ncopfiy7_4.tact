const GLOBAL_CONST: Int = 123;

contract Test {
    get fun getX(): Int {
        return GLOBAL_CONST;
    }
}
