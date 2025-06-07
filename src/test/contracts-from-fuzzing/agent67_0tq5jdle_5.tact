contract Test {
    receive() {
        // Testing repeat loop
        let twoPow: Int = 1;
        repeat (10) {
            twoPow *= 2; // augmented assignment
        }
        dump(twoPow); // Expecting 2^10 = 1024
    }
}
