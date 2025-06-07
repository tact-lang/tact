struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    optStr: String?;
    optBool: Bool?;
}

contract TestContract {
    nd: NestedOptional;

    init() {
        self.nd = NestedOptional{ inner: null };
    }
}