contract TestAugmentedAssignment {
    receive() {
        let x: Int = 0;
        x = 10;
        x += 5;  // x should now be 15
        dump(x);
    }
}
