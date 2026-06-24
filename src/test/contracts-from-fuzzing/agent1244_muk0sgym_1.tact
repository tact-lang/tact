struct InnerMost {
    val1: Int;
    val2: Bool;
    val3: String;
}

struct Middle {
    optInnerMost: InnerMost?;
    num: Int;
    flag: Bool;
}

struct Outer {
    middleStruct: Middle;
    textData: String;
    someBool: Bool;
    someInt: Int;
}

contract DeepNestedExample {
    complexState: Outer;

    init() {
        self.complexState = Outer{
            middleStruct: Middle{
                optInnerMost: null,
                num: 5,
                flag: true,
            },
            textData: "Hello",
            someBool: false,
            someInt: 42,
        };
    }
}
