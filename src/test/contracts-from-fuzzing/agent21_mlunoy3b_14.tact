contract TestTernary {
    receive() {
        // Testing ternary operator as an expression
        let x: Int = (5 > 3) ? 10 : 20;  // should evaluate to 10
        let msg: String = (x == 10) ? "Ternary works" : "Error in ternary";
        // Convert message to Cell using asComment
        let _cell: Cell = msg.asComment();
        return;
    }
}
