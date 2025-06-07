contract TestIfElseValid {
    receive() {
        if (true) { // proper curly brackets
            dump(1);
        } else {
            dump(0);
        }
    }
}
