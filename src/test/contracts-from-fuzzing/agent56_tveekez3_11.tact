contract TestTryNoCatch {
    receive() {
        try {
            dump(10);
        }
        dump(20);
    }
}
