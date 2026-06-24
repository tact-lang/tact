contract TestAssignment {
    receive() {
        let a: Int = 2;
        a += 3;
        dump(a);
    }
}
