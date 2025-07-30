struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String;
    pos: Point;
}

contract DeepAssign {
    p: Params;

    init() {
        self.p = Params{
            name: "A",
            pos: Point{ x: 10, y: 20 }
        };
    }
}