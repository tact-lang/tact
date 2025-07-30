struct SubInner {
    f: Int?;
}

struct Inner {
    a: Int;
    b: Bool?;
    c: SubInner;
}

contract NestedOptionalInner {
    nested: Inner;

    init() {
        self.nested = Inner{
            a: 13,
            b: null,
            c: SubInner { f: null }
        };
    }
}