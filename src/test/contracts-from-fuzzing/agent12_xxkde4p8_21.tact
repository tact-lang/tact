contract TestAugmented {
    receive() {
        let a: Int = 5;
        a += 5; // Augmented assignment
        dump(a); // Expect 10
    }
}
