contract TestIfElse {
    receive() {
        if (2 + 2 == 4) {
            dump("yes");
        } else {
            dump("no");
        }
    }
}
