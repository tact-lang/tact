contract Test {
    receive() {
        let a: Int = 123;  // inferring type from literal
        dump(a);
    }
}
