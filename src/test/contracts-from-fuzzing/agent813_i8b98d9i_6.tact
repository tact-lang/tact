struct SubInner {
    q: Bool;
}

struct InnerA {
    x: Int;
    y: SubInner;
}

struct InnerB {
    s: SubInner;
    flag: Bool;
}

contract MultipleNestedStructs {
    one: InnerA;
    two: InnerB;

    init() {
        self.one = InnerA{ x: 42, y: SubInner{ q: true } };
        self.two = InnerB{ s: SubInner{ q: false }, flag: true };
    }
}