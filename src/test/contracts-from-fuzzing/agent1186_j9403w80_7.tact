struct OptBool {
    b: Bool?;
}

struct OptInt {
    i: Int?;
}

struct OptString {
    s: String?;
}

struct OptionContainer {
    ob: OptBool;
    oi: OptInt;
    os: OptString;
}

contract ManyNestedOptionals {
    data: OptionContainer;

    init() {
        self.data = OptionContainer{
            ob: OptBool{b: null},
            oi: OptInt{i: 42},
            os: OptString{s: null},
        };
    }
}
