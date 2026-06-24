contract TestAssignment {
    receive() {
        let a: Int = 5;
        a = 10;
        a += 5;
        dump(a);
    }
}
