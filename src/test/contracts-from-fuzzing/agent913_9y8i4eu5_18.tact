struct Point {
    x: Int as int32;
    y: Int as int32;
}

struct Params {
    p1: Point;
    p2: Point;
    flag: Bool;
}

contract TestContract {
    params: Params;
    init() {
        self.params = Params{
            p1: Point{
                x: 1,
                y: 2
            },
            p2: Point{
                x: 3,
                y: 4
            },
            flag: true
        };
    }
}