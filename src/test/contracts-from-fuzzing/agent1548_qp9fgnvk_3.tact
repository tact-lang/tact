struct DeepNest {
    inner: Nested;
    number: Int;
}

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
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            inner: Nested{
                p: Point{ x:1, y:2 },
                label: "foo",
                flag: false
            },
            number: 42
        };
    }
}