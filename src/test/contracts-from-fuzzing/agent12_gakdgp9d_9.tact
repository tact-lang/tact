contract TestAssignment {
    receive() {
        let a: Int = 10;
        a = 20;
        dump(a);
    }
}
