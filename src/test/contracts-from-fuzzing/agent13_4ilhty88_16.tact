contract TestAssign {
    receive() {
        let x: Int = 5;
        x += 3; // expecting 8
        dump(x);
        x = x - 4; // expecting 4
        dump(x);
    }
}
