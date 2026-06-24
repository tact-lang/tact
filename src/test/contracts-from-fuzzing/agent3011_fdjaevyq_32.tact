struct NestedOnceMore {
    a: Int;
    b: InnerLayer;
}

struct InnerLayer {
    x: Int;
    y: String;
}

contract ManyNestedNamed {
    foo: NestedOnceMore;
    init() {
        self.foo = NestedOnceMore{ a: 777, b: InnerLayer{ x: 1, y: "b" } };
    }
}