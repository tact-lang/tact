contract TestIfElseIf {
    receive() {
        if (false) {
            dump(0);
        } else if (true) {
            dump(1);
        } else {
            dump(2);
        }
    }
}
