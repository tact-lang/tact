contract TestStateAugAssign {
    // Persistent state variable with default value
    count: Int = 10;

    // init() runs once at deployment, updating the state
    init() {
        // Augmented assignment on persistent state variable
        self.count += 5; // expected to update count from 10 to 15
    }

    // receive() function to observe the updated state
    receive() {
        dump(self.count); // Expected output: 15
    }
}
