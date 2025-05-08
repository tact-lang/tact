contract TestAssign {
    receive() {
        let x: Int = 5;
        x = x + 3;
        x += 2;
        dump(x);
    }
}
