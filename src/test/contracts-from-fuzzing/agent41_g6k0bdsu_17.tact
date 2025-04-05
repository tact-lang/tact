contract TestAugAssignment {
    receive() {
        let a: Int = 5;
        a += 5;
        dump(a);
    }
}
