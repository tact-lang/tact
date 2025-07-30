struct InnerMost {
    value: Int = 100;
}

struct Inner {
    nested: InnerMost;
}

struct Mid {
    nested: Inner;
}

struct Outer {
    nested: Mid;
}

contract DeeplyNestedStructContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Mid{
                nested: Inner{
                    nested: InnerMost{
                        value: 100
                    }
                }
            }
        };
    }
}