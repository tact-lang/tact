struct Point {
    x: Int;
    y: Int;
}

struct Params {
    count: Int = 0;
    name: String = "default";
    optionalVal: Bool?;
    nested: Point;
}

contract OptionalDefaults {
    params: Params;

    init() {
        self.params = Params{
            nested: Point{x: 1, y: 2}
        };
    }
}
