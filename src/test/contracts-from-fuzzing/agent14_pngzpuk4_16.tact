contract TestLoops() {
    fun run() {
        // Testing repeat loop
        let counter: Int = 0;
        repeat (3) {
            counter = counter + 1;
        }
        dump(counter); // Expected output: 3

        // Testing do...until loop
        let value: Int = 0;
        do {
            value = value + 2;
        } until (value >= 6);
        dump(value); // Expected output: 6

        // Testing while loop
        let count: Int = 5;
        while (count > 0) {
            count = count - 1;
        }
        dump(count); // Expected output: 0
    }

    receive() {
        self.run();
    }
}
