struct Nested {
    p: Point;
    label: String;
    flag: Bool;
}

struct Point {
    x: Int;
    y: Int;
}

contract Test {
    info: Nested;

    init() {
        self.info = Nested{
            p: Point{ x:10, y:20 },
            label: "test",
            flag: true
        };
    }
}