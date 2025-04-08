struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?; 
    point: Point;
}

contract OptDefNest {
    params: Params;

    init() {
        self.params = Params{
            point: Point{ x:42, y:7 }
        };
    }
}