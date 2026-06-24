struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    name: String = "Satoshi";
    age: Int?;
    pt: Point;
}

contract Defaults {
    params: Params = Params{pt: Point{x:1,y:2}};
    init() {
        self.params = Params{pt: Point{x:7,y:8}};
    }
    receive() {}
}