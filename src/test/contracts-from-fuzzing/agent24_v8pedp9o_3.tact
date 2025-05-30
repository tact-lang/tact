contract TestIfElse {
    receive() {
        if (1 + 1 == 2) {
            dump(100);
        } else {
            dump(200);
        }
        return;
    }
}
