contract TestOptionalExpr {
    receive() {
        let maybe: Int? = null;
        if (maybe == null) {
            // using assignment to optional variable
            maybe = 200;
        }
        let sum: Int = maybe!! + 50;
    }
}
