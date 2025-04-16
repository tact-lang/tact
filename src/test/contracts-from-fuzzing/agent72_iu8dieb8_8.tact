contract TestOptional {
    receive() {
        // Optional literal expression and non-null assertion
        let x: Int? = 42;
        let y: Int = x!!; // should extract 42
    }
}
