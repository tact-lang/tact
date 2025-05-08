struct NestedOptionalStruct {
    inner: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
    name: String?;
}

contract HasNestedOption {
    s: NestedOptionalStruct;
    init() {
        self.s = NestedOptionalStruct{
            inner: null
        };
    }
}