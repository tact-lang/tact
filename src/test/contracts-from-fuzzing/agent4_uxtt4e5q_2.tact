contract TestAugAssignment {
    receive() {
        let x: Int = 5;
        x += 5;
        dump(x);
    }
}
