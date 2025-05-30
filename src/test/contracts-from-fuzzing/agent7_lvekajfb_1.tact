struct Point {
    x: Int;
    y: Int;
}

fun test_point() : Int {
    let p = Point { x: 10, y: 20 };
    return p.x + p.y;
}
