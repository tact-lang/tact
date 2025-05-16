contract TestTernary {
    receive() {
        let a: Int = (2 + 2 == 4) ? 10 : 20;
    }
}
