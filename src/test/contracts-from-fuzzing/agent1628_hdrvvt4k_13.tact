struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

contract TestContract {
    param: Params;

    init() {
        self.param = Params{
            point: Point{
                x: 123,
                y: 456
            },
            age: 99,
            name: "Vitalik"
        };
    }
}