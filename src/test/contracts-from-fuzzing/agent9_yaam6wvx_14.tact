// Test Snippet A: Basic Struct Instantiation & Field Access
struct Point {
    x: Int;
    y: Int;
}

fun main() : Int {
    // Basic instantiation using explicit keys
    let p: Point = Point{ x: 10, y: 20 };
    return p.x + p.y; // Expected: 30
}
