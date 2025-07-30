struct Point {
    x: Int;
    y: Int;
}

struct Params {
    coord: Point;
    label: String;
    flag: Bool?;
}

contract Test4 {
    info: Params;

    init() {
        self.info = Params{
            coord: Point{ x:1, y:2 },
            label: "Test",
            flag: null,
        };
    }
}