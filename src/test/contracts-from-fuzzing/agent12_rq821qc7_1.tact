contract Test {
    receive() {
        // Testing local variable declaration with type inference and explicit type as described in the documentation 
        let a = 10;
        let b: Int = 20;
        dump(a + b);
    }
}
