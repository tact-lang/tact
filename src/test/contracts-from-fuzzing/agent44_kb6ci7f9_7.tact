struct Point { x: Int; y: Int }

contract TestFieldAccess {
    receive() {
        let p: Point = Point { x: 10, y: 20 };
        let sum: Int = p.x + p.y;
        dump(sum);
    }
}
