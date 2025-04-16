struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

contract NestedDefaults {
    val: Params;
    init() {
        self.val = Params{
            point: Point{ x:4, y:2 },
        };
    }
}