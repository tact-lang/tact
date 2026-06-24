contract TestAssign {
    receive() {
        let x: Int = 10;
        x = 20;
        x += 5;  // x becomes 25
        dump(x);
    }
}
