contract Test {
    receive() {
        let a: Int? = null;
        a = 42;
        dump(a!!);
    }
}