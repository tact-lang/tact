contract TestAugAssignment {
    receive() {
        let a: Int = 5;
        a += 3;
        dump(a);
    }
}
