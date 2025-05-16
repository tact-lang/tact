contract TestIfElse {
    receive() {
        let a: Int = 10;
        if (a == 10) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
