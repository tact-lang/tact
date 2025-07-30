struct Inner {
    innerVal: Int = 10;
}

struct Outer {
    nested1: Inner = Inner{};
    nested2: Inner = Inner{};
    nested3: Inner = Inner{};
}

contract RepeatedStructFields {
    content: Outer = Outer{};

    init() {
        self.content = Outer{
            nested1: Inner{ innerVal: 1 },
            nested2: Inner{ innerVal: 2 },
            nested3: Inner{ innerVal: 3 }
        };
    }
}