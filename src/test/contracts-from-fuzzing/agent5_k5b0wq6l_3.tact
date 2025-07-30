contract Test {
    receive() {
        dump(null); // Expect dump to properly print null or equivalent
    }
}
