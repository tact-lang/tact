contract TestAugmentedAssignment {
    receive() {
        let a: Int = 10;
        a += 5;    // a becomes 15
        a -= 3;    // a becomes 12
        a *= 2;    // a becomes 24
        a /= 2;    // a becomes 12
        a %= 5;    // a becomes 2

        let b: Bool = true;
        // For booleans, augmented assignment works on logical operators
        let mutableB: Bool = b;
        mutableB &&= false; // mutableB becomes false
        mutableB ||= true;  // mutableB becomes true
    }
}
