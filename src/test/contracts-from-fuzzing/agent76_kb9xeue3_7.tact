struct InnerMost {
    leaf: Int;
}

struct Mid {
    inner: InnerMost;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
    mid3: Mid;
    mid4: Mid;
    mid5: Mid;
}

contract Test {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid1: Mid{ inner: InnerMost{ leaf: 1 } },
            mid2: Mid{ inner: InnerMost{ leaf: 2 } },
            mid3: Mid{ inner: InnerMost{ leaf: 3 } },
            mid4: Mid{ inner: InnerMost{ leaf: 4 } },
            mid5: Mid{ inner: InnerMost{ leaf: 5 } }
        };
    }
}
