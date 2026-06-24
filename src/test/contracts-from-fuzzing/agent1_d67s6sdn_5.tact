struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

fun test_nested() : String {
    let p = Params{ point: Point{ x: 5, y: 7 } };
    return p.name;
}
