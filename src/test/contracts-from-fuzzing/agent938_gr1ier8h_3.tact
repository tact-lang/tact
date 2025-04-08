struct DeepNested {
    innerNumber: Int;
    innerBool: Bool;
}

struct Middle {
    middleBool: Bool;
    inner: DeepNested;
}

struct Outer {
    outerInt: Int;
    middle: Middle;
    outerStr: String;
}

contract DeepNestedContract {
    st: Outer;

    init() {
        self.st = Outer{
            outerInt: 1,
            middle: Middle{
                middleBool: true,
                inner: DeepNested{
                    innerNumber: 2,
                    innerBool: false,
                },
            },
            outerStr: "hello",
        };
    }
}
