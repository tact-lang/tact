struct Point { x: Int; y: Int; }

contract Test {
    receive() {
        let p = Point { x: 10, y: 20 };
        dump(p.x);
    }
}
