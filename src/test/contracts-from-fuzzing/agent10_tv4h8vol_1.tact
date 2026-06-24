contract TestIf {
    receive() {
        let x: Int = 10;
        if (x > 5) {
            dump(x);
        }
    }
}
