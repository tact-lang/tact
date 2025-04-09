struct Point {
    x: Int;
    y: Int;
}

contract StructTest {
    fun run() {
        let pt: Point = Point{ x: 10, y: 20 };
        dump(pt.x + pt.y);
    }
}
