contract TestTernary {
    receive() {
        let a: Int = true ? 1 : 2;
        let b: Int = false ? 1 : 2;
    }
}
