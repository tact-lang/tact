struct NestedInner {
    x: Int;
    y: Bool;
}

struct Outer {
    nested: NestedInner;
    flag: Bool;
    num: Int;
}

contract NestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: NestedInner{ x: 10, y: false },
            flag: true,
            num: 99,
        };
    }
}