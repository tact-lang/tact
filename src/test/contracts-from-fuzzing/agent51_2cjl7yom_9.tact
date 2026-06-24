contract Test {
    receive() {
        let a: String = "hello";
        let b: String = "hello";
        if (a == b) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
