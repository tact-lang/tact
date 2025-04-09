contract TestTryNoCatch {
    receive() {
        try {
            throw(101);
        }
        return;
    }
}
