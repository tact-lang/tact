struct Point {
    x: Int;
    y: Int;
}

contract TestDestructuring {
    receive() {
        let Point { x, y } = Point { x: 10, y: 20 };
        dump(x + y); // Expected output: 30
    }
}
