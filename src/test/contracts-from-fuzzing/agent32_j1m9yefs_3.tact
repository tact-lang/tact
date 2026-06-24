contract TestAugAssignment {
    receive() {
        let x: Int = 0;
        x += 5;
        dump(x);
    }
}
