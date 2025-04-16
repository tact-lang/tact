struct Point {
    x: Int;
    y: Int;
}

fun test_point() : Int {
    let p = Point { x: 5, y: 10 };
    return p.x + p.y;
}

// Expected output: 15
