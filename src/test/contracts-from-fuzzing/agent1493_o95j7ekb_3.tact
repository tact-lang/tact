struct Point {
    x: Int as int64;
    y: Int as int64;
    flag: Bool;
    opt: Int?;
    text: String;
}

contract ComplexStorage {
    pt: Point;

    init() {
        self.pt = Point { x: 1, y: 2, flag: true, opt: null, text: "abc" };
    }
}
