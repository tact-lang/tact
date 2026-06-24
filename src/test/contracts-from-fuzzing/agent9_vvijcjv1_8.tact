contract TestAugAssign {
    receive() {
        let x: Int = 10;
        x += 5;
        dump(x); // Expected output: 15
    }
}
