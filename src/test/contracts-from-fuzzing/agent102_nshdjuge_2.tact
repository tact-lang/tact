struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: InnerMost;
    z: String;
}

struct Outer {
    middle: Middle;
    flag: Bool;
    count: Int;
}

contract DeepNestedTest {
    data: Outer;
    init() {
        self.data = Outer{
            middle: Middle{
                inner: InnerMost{
                    x: 123,
                    y: true
                },
                z: "hello"
            },
            flag: false,
            count: 789
        };
    }
}
