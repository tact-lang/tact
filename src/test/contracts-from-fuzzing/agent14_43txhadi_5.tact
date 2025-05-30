contract TestAugmentedAssignment {
    receive() {
        let value: Int = 10;
        value += 5; // plus assignment
        dump(value); // expecting 15
    }
}
