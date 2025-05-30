contract Test {
    receive() {
        // Compare two identical string literals using '=='
        if ("hello" == "hello") {
            dump(1);
        } else {
            dump(0);
        }
    }
}
