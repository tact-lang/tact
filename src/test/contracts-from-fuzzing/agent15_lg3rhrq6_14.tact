contract Test {
    receive() {
        // Test: try statement without a catch block
        try {
            dump(1);
        }
        dump(2);
    }
}
