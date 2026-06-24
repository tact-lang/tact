struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?; // optional, defaults to null
    point: Point;
}

fun main() {
    // Instantiation using defaults for 'name' and 'age'
    let p1 = Params{ point: Point{x: 0, y: 0} };
    // Overriding default for 'name'
    let p2 = Params{ name: "Test", point: Point{x: 1, y: 2} };
}
