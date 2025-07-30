struct Point {
    x: Int;
    y: Int;
    flag: Bool;
    label: String;
    value: Int?;
}

contract Test {
    pt: Point;
    init() {
        self.pt = Point{
            x: 1,
            y: 2,
            flag: true,
            label: "test",
            value: null,
        };
    }
}