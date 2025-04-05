contract TestUnary {
    receive() {
        // Unary minus on an integer
        let neg: Int = -42;
        // Logical not on boolean
        let boolNot: Bool = !false;

        // Casting: using string literal cast function provided in stdlib
        let str: String = "Test";
        let commentCell = str.asComment();

        dump(neg);
        dump(boolNot);
        dump(commentCell);
    }
}
