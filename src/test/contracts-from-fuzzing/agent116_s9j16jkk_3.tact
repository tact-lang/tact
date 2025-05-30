struct InnerMost {
    f1: Int;
    f2: Bool;
}

struct Middle {
    midField1: InnerMost;
    midField2: Int;
}

struct Outer {
    outerField1: Middle;
    outerField2: String;
}

contract DeepNestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            outerField1: Middle{
                midField1: InnerMost{
                    f1: -5,
                    f2: true,
                },
                midField2: 100,
            },
            outerField2: "deep",
        };
    }

    receive() {}
}