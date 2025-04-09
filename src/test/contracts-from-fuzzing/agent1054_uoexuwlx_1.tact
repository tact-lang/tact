contract TestContract {
    nested: Params;

    init() {
        self.nested = Params{
            name: "Alice",
            point: Point{ x: 100, y: 200 }
        };
    }
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

struct Point {
    x: Int as int64;
    y: Int as int64;
}