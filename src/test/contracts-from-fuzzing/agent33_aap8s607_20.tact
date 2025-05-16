contract TestAugmentedAssignment {
    receive() {
        let x: Int = 5;
        // Augmented assignment operator works as a statement; result of x expected to be 8
        x += 3;
        x -= 2;
        x *= 2;
        x /= 3; // integer division
    }
}
