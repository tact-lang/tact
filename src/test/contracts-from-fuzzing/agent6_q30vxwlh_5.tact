contract TestIfValid {
    receive() {
        if (true) {
            dump(1);
        }
    }
}
