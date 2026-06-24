contract TestOptionalExpressions {
    receive() {
        let opt: Int? = 42;
        dump(opt!!); // unwrapping the optional; expected output: 42
    }
}
