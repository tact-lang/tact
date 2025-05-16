contract TestAssignment {
    receive() {
        let x: Int = 10;
        x = 20;
        x += 5;
        dump(x); // Expected output: 25
    }
}
