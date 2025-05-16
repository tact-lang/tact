struct Child {
    x: Int?;
    y: Bool;
}

struct Parent {
    c: Child;
    s: String?;
}

contract MultiNested {
    p1: Parent = Parent{ c: Child{ x: null, y: false }, s: null };
    p2: Parent = Parent{ c: Child{ x: 123, y: true }, s: "abc" };

    init() {
        self.p1 = Parent{ c: Child{ x: 5, y: true }, s: "test" };
        self.p2 = Parent{ c: Child{ x: null, y: false }, s: null };
    }
}