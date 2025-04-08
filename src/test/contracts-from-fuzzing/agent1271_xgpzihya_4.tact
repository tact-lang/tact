struct InnerMost {
    x: Int;
    y: Bool;
}

struct Inner {
    a: InnerMost;
    b: Int?;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    flag: Bool;
}

contract DeepStructTest {
    value: Outer;
    init() {
        self.value = Outer{
            nested1: Inner{
                a: InnerMost{ x: 1, y: true },
                b: null
            },
            nested2: Inner{
                a: InnerMost{ x: 2, y: false },
                b: 42
            },
            flag: true
        };
    }
    receive() {}
}