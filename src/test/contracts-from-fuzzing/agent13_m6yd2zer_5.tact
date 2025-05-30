contract TestIfElse {
    receive() {
        let a: Int = 2 + 2;
        if (a == 4) {
            dump(1);
        } else {
            dump(0);
        }
    }
}
