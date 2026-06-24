contract TestContract {
    receive() {
        // repeat loop: executing the block exactly 3 times
        let count: Int = 0;
        repeat (3) {
            count = count + 1;
        }
        dump(count); // Expected output: 3
    }
}
