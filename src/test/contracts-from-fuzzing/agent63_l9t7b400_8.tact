contract TestIfElse {
    receive() {
        let a: Int = 3;
        if (a > 5) {
            dump(1);
        } else {
            dump(2);
        }
    }
}
