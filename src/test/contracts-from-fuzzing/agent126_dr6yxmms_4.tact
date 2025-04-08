struct InnerMost {
    enabled: Bool;
    count: Int;
}

struct Middle {
    label: String;
    inner: InnerMost;
}

struct Outer {
    id: Int;
    middle: Middle;
}

contract DeepNestedStructFields {
    data: Outer;

    init() {
        self.data = Outer{
            id: 7,
            middle: Middle{
                label: "label",
                inner: InnerMost{
                    enabled: true,
                    count: 3
                }
            }
        };
    }
}