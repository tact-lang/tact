contract TestIfElseNested {
    receive() {
        // If-Else If-Else nested test
        if (false) {
            dump(0);
        } else if (true) {
            dump(1);
        } else {
            dump(2);
        }
    }
}
