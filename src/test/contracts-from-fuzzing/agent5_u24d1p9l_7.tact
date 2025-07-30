contract Test2 {
    const CAPACITY: Int = 100;

    receive() {
        // Use constant in a condition
        if (self.CAPACITY > 50) {
            // Branch taken at compile-time evaluation
            let x: Int = self.CAPACITY / 2;
        } else {
            let y: Int = self.CAPACITY * 2;
        }
    }
}
