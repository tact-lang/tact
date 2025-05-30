struct OptionInt {
    val: Int?;
}

struct OptionBool {
    val: Bool?;
}

contract NestedOptionalsContract {
    optInt: OptionInt;
    optBool: OptionBool;

    init() {
        self.optInt = OptionInt{val: null};
        self.optBool = OptionBool{val: null};
    }
}