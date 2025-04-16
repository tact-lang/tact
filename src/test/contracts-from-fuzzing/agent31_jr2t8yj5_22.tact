struct ManyNestedOptional {
    a: Int?;
    b: NestedInner?;
}

struct NestedInner {
    c: Int?;
    d: Bool?;
}

contract Test {
    data: ManyNestedOptional;
    init() {
        self.data = ManyNestedOptional{
            a: null,
            b: null,
        };
    }
}
