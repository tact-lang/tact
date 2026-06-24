contract TestTryWithoutCatch {
    receive() {
        // Try block without a catch clause
        try {
            dump(10);
        }
        // Following code should execute normally since no exception was thrown
        dump(20);
    }
}
