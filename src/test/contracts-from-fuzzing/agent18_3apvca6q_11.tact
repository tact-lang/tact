contract TestOptionalAssertions {
    receive() {
        let x: Int? = 10;
        dump(x!!); // non-null assertion, should output 10
    }
}
