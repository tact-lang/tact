contract TestIfGood {
    receive() {
        if (true) {
            dump(100);
        } else {
            dump(0);
        }
    }
}
