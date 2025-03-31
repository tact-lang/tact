struct Point {
    x: Int;
    y: Int;
}

struct Curved {
    center: Point;
    radius: Int = 5;
}

fun test_nested() {
    let c = Curved { center: Point { x: 3, y: 4 } };
}
