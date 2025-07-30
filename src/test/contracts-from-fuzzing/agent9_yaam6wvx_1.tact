struct Point {
    x: Int;
    y: Int;
}

fun main() : Int {
    let p: Point = Point{ x: 10, y: 20 };
    return p.x + p.y;
}
