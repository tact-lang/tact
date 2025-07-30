struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Outer {
    optInner: NestedOptional?;
    someVal: Int;
}

contract Test {
    outer: Outer;

    init() {
        self.outer = Outer{
            optInner: null,
            someVal: 10
        };
    }
}