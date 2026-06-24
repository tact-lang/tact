contract TestTryWithoutCatch {
    receive() {
        try {
            dump(123);
        }
    }
}
