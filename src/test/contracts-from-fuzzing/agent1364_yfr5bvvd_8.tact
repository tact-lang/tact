struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract Test {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Middle{
                inner: InnerMost{ a: 5, b: null }
            }
        };
    }
}
