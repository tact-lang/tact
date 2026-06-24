contract TestNonNullAssert {
    receive() {
        let x: Int? = 123;
        let y: Int = x!!;
        y;
    }
}
