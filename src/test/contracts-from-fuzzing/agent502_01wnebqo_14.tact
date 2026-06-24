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
    params: Params;

    init() {
        self.params = Params{
            point: Point{x:1,y:2},
            age: null
        };
    }
}