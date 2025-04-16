contract TestTernary {
    receive() {
        let a: Int = true ? 1 : 2;
        dump(a); // Expected output 1
    }
}
