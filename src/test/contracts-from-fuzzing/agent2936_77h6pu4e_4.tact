struct InnerMost {
    v: Int;
}

struct Inner {
    m: InnerMost;
    flag: Bool;
}

struct Outer {
    nested: Inner;
    text: String;
    n: Int?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                m: InnerMost{v: 10},
                flag: true
            },
            text: "abc",
            n: null
        };
    }
}