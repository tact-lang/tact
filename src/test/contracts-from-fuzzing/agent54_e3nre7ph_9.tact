contract TestAssignment {
    receive() {
        let a: Int = 5;
        a = 15;
        a += 10; // augmented assignment
        dump(a); // should dump 25
    }
}
