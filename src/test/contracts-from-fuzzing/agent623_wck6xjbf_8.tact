struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    p: Point;
}

contract DefVals {
    prm: Params;

    init() {
        self.prm = Params{
            p: Point{
                x: 1,
                y: 2,
            },
        };
    }
}