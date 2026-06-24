struct NestedOpt {
    x: Int?;
    y: Int?;
}

struct Outer {
    nested: NestedOpt?;
}

contract Test {
    data: Outer?;

    init() {
        self.data = null;
    }
}