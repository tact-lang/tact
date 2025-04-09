contract TestAugAssign {
    receive() {
        // Testing augmented assignment operators for Int
        let value: Int = 10;
        // Augmented assignment should effectively compute: value = value + 5
        value += 5;
        // And then subtract 3
        value -= 3;
        dump(value); // Expected: 10 + 5 - 3 = 12
    }
}
