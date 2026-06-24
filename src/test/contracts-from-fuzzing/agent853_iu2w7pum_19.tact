message(9999) InnerMsg {
    foo: Int?;
}

struct MiddleMix {
    msgOpt: InnerMsg?;
    str: String;
    numOpt: Int?;
}

message(8888) OuterMsg {
    middleOpt: MiddleMix?;
    bar: Bool;
}

contract OptionCombo {
    data: OuterMsg?;

    init() {
        self.data = null;
    }
}