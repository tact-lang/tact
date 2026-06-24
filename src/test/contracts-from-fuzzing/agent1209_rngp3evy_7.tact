struct InnerMost {
    z: Int;
}

struct Middle {
    m: InnerMost;
    flag: Bool;
}

struct Outer {
    nested: Middle?;
    label: String;
    count: Int;
}

contract ExtremeNesting {
    data: Outer;
    init() {
        self.data = Outer{
            nested: Middle{
                m: InnerMost{z: 123},
                flag: true
            },
            label: "deep",
            count: 5
        };
    }
}