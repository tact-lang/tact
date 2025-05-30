/// Snippet 1: Destructuring a struct with discard
struct Point {
    x: Int;
    y: Int;
}

fun testDestructure(p: Point) : Int {
    let Point { x, y: _ } = p;
    return x;
}

fun main() : Int {
    let p = Point { x: 10, y: 20 };
    return testDestructure(p);
}
