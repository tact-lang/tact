contract TestTryNoCatch {
    receive() {
        // Try block without catch clause; no error thrown
        try {
            dump(1);
        }
        // Following statement should execute normally
        dump(2);
    }
}
