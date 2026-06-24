contract TestTernarySimple {
    receive() {
        let a: Int = true ? 1 : 0;
        a;
    }
}
