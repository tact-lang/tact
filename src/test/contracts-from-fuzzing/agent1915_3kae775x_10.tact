struct InnerStr {
    str: String;
}

struct MiddleStr {
    inner: InnerStr;
}

contract NestedStringStruct {
    s: MiddleStr;

    init() {
        self.s = MiddleStr{ inner: InnerStr{ str: "hello" } };
    }
}