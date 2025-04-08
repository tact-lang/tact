struct InnerMost {
    v1: Int?;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inner: Inner?;
}

contract MixedNestedOptional {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                im: InnerMost{ v1: null }
            }
        };
    }
}