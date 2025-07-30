struct OptionalStr {
    txt: String?;
}

struct OptionalNum {
    val: Int?;
}

contract NestedOptionalFields {
    optStr: OptionalStr;
    optNum: OptionalNum;

    init() {
        self.optStr = OptionalStr{ txt: null };
        self.optNum = OptionalNum{ val: 42 };
    }
}
