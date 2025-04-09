contract TestNestedIfElse {
    receive() {
        let x: Int = 5;
        if (x > 10) {
            dump(10);
        } else if (x > 3) {
            dump(3);
        } else {
            dump(0);
        }
    }
}
