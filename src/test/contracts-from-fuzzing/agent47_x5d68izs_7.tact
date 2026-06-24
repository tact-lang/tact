contract TestIfElse {
    receive() {
        // First if-else
        if (2 + 2 == 4) {
            dump("ok");
        } else {
            dump("not ok");
        }

        // Second if-else-if structure
        if (1 > 2) {
            dump("impossible");
        } else if (1 == 1) {
            dump("true branch");
        } else {
            dump("false branch");
        }
    }
}
