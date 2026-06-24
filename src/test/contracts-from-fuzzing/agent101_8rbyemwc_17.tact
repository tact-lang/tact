struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    name: String = "Agent";
    coord: Point;
    comment: String?;
}

contract TestContract {
    p: Params;
    init() {
        self.p = Params{ coord: Point{ x:1,y:2 }, comment:null };
    }
}