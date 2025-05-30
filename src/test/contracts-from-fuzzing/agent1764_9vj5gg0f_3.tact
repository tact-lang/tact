struct InnerMost {
    value: Int?;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid: Middle{
                inner: InnerMost{ value: 123 }
            }
        };
    }
}
