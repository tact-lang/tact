struct InnerMost {
    deep: Int;
    flag: Bool;
}

struct Mid {
    inner: InnerMost;
    label: String;
}

struct Outer {
    middle: Mid;
    count: Int;
}

contract DeepNestedContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Mid{
                inner: InnerMost{
                    deep: 42,
                    flag: true
                },
                label: "deep"
            },
            count: 7
        };
    }
}