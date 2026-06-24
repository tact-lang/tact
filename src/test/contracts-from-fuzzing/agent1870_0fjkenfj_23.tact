struct NestedStr {
    str: String;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    optText: String?;
}

contract StrDeepOpt {
    val: NestedStr;

    init() {
        self.val = NestedStr {
            str: "abc",
            inner: InnerStruct {
                flag: false,
                optText: null
            }
        };
    }
}
