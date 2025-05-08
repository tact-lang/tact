struct InnerMost {
    a: Int?;
    b: String;
}

struct Middle {
    x: Int;
    y: InnerMost;
}

struct Outer {
    flag: Bool;
    nested: Middle;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            flag: false,
            nested: Middle{
                x: 123,
                y: InnerMost{
                    a: 99,
                    b: "hi",
                },
            },
        };
    }
}
