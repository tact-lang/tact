contract TestOptionalUnwrap {
    receive() {
        let x: Int? = 123;
        let y: Int = x!!; // force unwrap; expected y = 123
    }
}
