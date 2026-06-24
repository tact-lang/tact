contract TestIfElse {
    receive() {
        let a: Int = 5;
        if (a >= 5) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
