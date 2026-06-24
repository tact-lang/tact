contract TestOptionalExpressions {
    receive() {
        let opt: Int? = 99;
        dump(opt!!);               // using the non-null assertion operator
        dump(opt!!.toString());    // chaining a method call on the non-null value
    }
}
