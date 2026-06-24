struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    description: String;
}

contract NestedStructsTest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{value: 42},
                flag: true,
            },
            description: "Deep"
        };
    }
}