contract TestIfElse {
    receive() {
        let a: Int = 5;
        if (a > 3) {
            dump(10);
        } else {
            dump(0);
        }
    }
}
