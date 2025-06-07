contract TestTernary {
    receive() {
        let a: Int = true ? 10 : 20;   // expected 10
        let b: Int = false ? 10 : 20;  // expected 20
        if (a + b != 30) {
            throw(1);
        }
    }
}
