const TERNARY_CONST: Int = (2 + 2 == 4) ? 10 : 20;

contract TestTernary {
    receive() {
        dump(TERNARY_CONST);
    }
}
