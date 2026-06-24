contract TestIf {
    receive() {
        if (true) {
            let x: Int = 1;
            dump(x);
        } else {
            let x: Int = 2;
            dump(x);
        }
    }
}
