struct DeepInner {
    x: Int;
    y: Bool;
}

struct Middle {
    inner: DeepInner;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    label: String;
}

contract DeepNestedTest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: DeepInner{
                    x: 42,
                    y: false,
                },
                flag: true,
            },
            label: "Deep nested",
        };
    }
}
