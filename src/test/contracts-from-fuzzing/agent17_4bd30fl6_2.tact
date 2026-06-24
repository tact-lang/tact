struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

fun test() {
    let p = Params{ point: Point{ x: 0, y: 1 } };
    let n = p.name;
}
