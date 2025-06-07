struct Point { x: Int; y: Int; }

contract TestStructValid {
    fun run() {
        let p: Point = Point{ x: 10, y: 20 };
        dump(p.x);
        dump(p.y);
    }
    receive() {}
}
