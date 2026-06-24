struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

fun main() : Int {
    let p = Params{ point: Point{ x: 10, y: 20 } };
    // Expecting default value for 'name' and null for 'age'
    return p.point.x + p.point.y; // should return 30
}
