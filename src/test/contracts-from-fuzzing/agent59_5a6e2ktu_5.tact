struct Point {
    x: Int as int64;
    y: Int as int64;
}

struct Params {
    coord: Point;
    name: String = "Origin";
    enabled: Bool = true;
    description: String?;
}

contract TestContract {
    p: Params;

    init() {
        self.p = Params{
            coord: Point{ x: 0, y: 0 },
            description: null
        };
    }
}