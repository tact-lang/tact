struct InnerMost {
    flag: Bool;
    message: String;
}

struct Middle {
    innerMost: InnerMost;
    optVal: Int?;
}

contract DeepNestedStruct {
    middle: Middle;

    init() {
        self.middle = Middle {
            innerMost: InnerMost { flag: true, message: "msg" },
            optVal: null
        };
    }
}