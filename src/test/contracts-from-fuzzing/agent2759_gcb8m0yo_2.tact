struct DeepInner {
    value: Int;
    enabled: Bool;
}

struct Mid {
    inner: DeepInner;
    status: Bool;
}

struct Outer {
    middle: Mid;
    counter: Int;
}

contract DeepNestedTest {
    deepField: Outer;

    init() {
        self.deepField = Outer{
            middle: Mid{
                inner: DeepInner{
                    value: 7,
                    enabled: true
                },
                status: false
            },
            counter: 99
        };
    }
}