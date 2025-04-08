struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

contract ComplexContract {
    params: Params;
    init() {
        self.params = Params{
            point: Point{ x: 10, y: 20 }
        };
    }
}