contract TestIfNoElse {
    receive() {
        if (false) {
            dump(1);
        }
        dump(2);
    }
}
