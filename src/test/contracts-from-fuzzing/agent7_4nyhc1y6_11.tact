contract TestAssignment {
    receive() {
        let x: Int = 1;
        x = 2;
        x += 3; // augmented assignment
        dump(x); // should dump 5
    }
}
