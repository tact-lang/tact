struct Point {
    x: Int;
    y: Int;
}

struct WithDefault {
    p: Point;
    label: String = "origin";
}

contract HasDefaults {
    data: WithDefault;
    init() {
        self.data = WithDefault{
            p: Point{ x: 0, y: 0 }
        };
    }
}