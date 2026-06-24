struct Point { x: Int; y: Int; }

contract TestFieldAccess {
    receive() {
       let p: Point = Point { x: 10, y: 20 };
       dump(p.x);
       dump(p.y);
       dump(p.x + p.y);
    }
}
