const CONST_EXPR: Int = 10 + 20 * 3;

contract TestExpr {
    receive() {
        let value: Int = CONST_EXPR;
    }
}
