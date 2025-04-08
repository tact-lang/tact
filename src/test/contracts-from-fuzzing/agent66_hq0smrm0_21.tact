struct DeepInner {
    a: Int;
    b: String;
}

struct Middle {
    nested: DeepInner?;
}

contract Test {
    optStruct: Middle?;

    init() {
        self.optStruct = Middle{
            nested: DeepInner{
                a: 123,
                b: "xxx",
            },
        };
    }
}
