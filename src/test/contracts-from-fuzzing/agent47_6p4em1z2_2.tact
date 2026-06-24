contract TestLiterals_Int {
    receive() {
        let a: Int = 123;
        dump(a.toString());
    }
}
