contract TestTryNoCatch {
    receive() {
        // Using try block without a catch block
        try {
            throw(1042);
        }
        dump(1042);
    }
}
