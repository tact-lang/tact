contract TestTryNoCatch {
    receive() {
        try {
            throw(123);
        }
        dump(123);
    }
}
