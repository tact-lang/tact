struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    inner: InnerMost;
    str: String;
}

struct Outer {
    mid1: Middle;
    mid2: Middle;
}

contract NestedStructs {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid1: Middle{
                inner: InnerMost{ a: 1, b: true },
                str: "one"
            },
            mid2: Middle{
                inner: InnerMost{ a: 2, b: null },
                str: "two"
            }
        };
    }
}