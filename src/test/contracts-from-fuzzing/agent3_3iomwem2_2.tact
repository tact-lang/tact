struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

fun test_params() : String {
    let p = Params{ point: Point { x: 3, y: 4 } };
    return p.name;
}

// Expected to return "Satoshi" at runtime
