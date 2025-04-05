contract TestTryNoCatch {
    receive() {
        try {
            dump(100);
        }
        // no catch block provided
    }
}
