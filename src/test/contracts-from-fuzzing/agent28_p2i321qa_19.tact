contract TestAugmentedAssignment {
    receive() {
        let a: Int = 1;
        a += 2;
        dump(a); // Expected output: 3
    }
}
