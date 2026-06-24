contract TestTernary {
    receive() {
        let a: Int = true ? 1 : 2;
    }
}
