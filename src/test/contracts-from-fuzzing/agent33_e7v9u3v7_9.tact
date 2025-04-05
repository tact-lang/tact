contract TestTryNoCatch {
    receive() {
        // Try statement without catch; no exception thrown
        try {
            dump(1);
        }
        dump(2);
    }
}
