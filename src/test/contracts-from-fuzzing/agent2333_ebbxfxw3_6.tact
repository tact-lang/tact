struct InnerMost {
    val: Int?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    nested: Middle?;
}

contract TripleOption {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Middle{
                inner: InnerMost{ val: 123 }
            }
        };
    }
}