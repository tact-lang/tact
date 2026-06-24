struct InnerMost {
    value: Int;
    flag: Bool;
}

struct Inner {
    innerMost: InnerMost;
    amount: Int;
}

struct Outer {
    name: String;
    inner: Inner;
}

contract NestedStructs {
    data: Outer = Outer{
        name: "X",
        inner: Inner{
            innerMost: InnerMost{ value: 1, flag: true },
            amount: 99
        }
    };

    init() {
        self.data = Outer{
            name: "Y",
            inner: Inner{
                innerMost: InnerMost{ value: 2, flag: false },
                amount: 100
            }
        };
    }
}
