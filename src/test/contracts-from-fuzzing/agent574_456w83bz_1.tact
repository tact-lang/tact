struct LargeNested {
    a: Int;
    b: Int;
    inner: Point;
}

struct Point {
    x: Int;
    y: Int;
}

contract MultiNestedStruct {
    nested: LargeNested;

    init() {
        self.nested = LargeNested{
            a: 10,
            b: 20,
            inner: Point{ x: 1, y: 2 }
        };
    }
}