contract Test {
    receive() {
        if (true) {
            let a: Int = 1; dump(a);
        } else {
            let a: Int = 2; dump(a);
        }
    }
}
