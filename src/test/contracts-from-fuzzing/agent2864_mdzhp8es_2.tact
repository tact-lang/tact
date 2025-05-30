struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

contract NestedOptionalContract {
    data: Params;

    init() {
        self.data = Params{
            point: Point{ x: 42, y: 21 }
        };
    }
}