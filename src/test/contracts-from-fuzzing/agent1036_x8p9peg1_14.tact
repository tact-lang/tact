struct NestedStruct {
    nested1: NestedInner;
    nested2: NestedInnerOpt?;
}

struct NestedInner {
    txt: String;
    num: Int;
}

struct NestedInnerOpt {
    flag: Bool;
    strOpt: String?;
}

contract NestedStructContract {
    data: NestedStruct;
    init() {
        self.data = NestedStruct{
            nested1: NestedInner{ txt: "abc", num: 42 },
            nested2: NestedInnerOpt{ flag: true, strOpt: "def" }
        };
    }
}