/* Test: Try without catch block (valid statement) */
contract TestTryWithoutCatch {
    receive() {
        try {
            dump(100);
        }
        dump(200);
    }
}
