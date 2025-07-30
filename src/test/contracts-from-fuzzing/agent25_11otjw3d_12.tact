struct Point { x: Int; y: Int; }

contract DestructureTest() {
    receive() {
        let p: Point = Point{ x: 3, y: 7 };
        let Point{ x, .. } = p;
        dump(x); // Expected output: 3
        cashback(sender());
    }
}
