struct InnerOpt {
    value: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
    flag: Bool;
}

contract NestedOptionalStruct {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ inner: null, flag: true };
    }
}