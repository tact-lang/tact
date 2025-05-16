contract Test {
    receive() {
        let a: Int = 3;
        if (a > 2) {
            dump(a);
        }
    }
}
