contract TestRepeat {
    counter: Int;

    init() {
        self.counter = 0;
    }

    receive() {
        // This repeat loop should not execute (0 times)
        repeat (0) {
            self.counter = self.counter + 1;
        }

        // This repeat loop with a negative number should be ignored
        repeat (-5) {
            self.counter = self.counter + 10;
        }
    }
}
