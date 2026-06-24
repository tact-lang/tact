struct Point {
    x: Int;
    y: Int;
}

struct NamedPoint {
    name: String;
    point: Point;
}

struct Annotation {
    key: String;
    value: String;
}

contract MultiNested {
    label: String;
    np: NamedPoint;
    annotation: Annotation;

    init() {
        self.label = "Test";
        self.np = NamedPoint{
            name: "origin",
            point: Point{ x: 0, y: 0 }
        };
        self.annotation = Annotation{ key: "k", value: "v" };
    }
}