struct Point {
    x: Int;
    y: Int;
}

fun main() : Int {
    let p = Point{ x: 3, y: 4 };
    return p.x + p.y;
}
