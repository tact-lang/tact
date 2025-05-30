struct NestedOfOptionalStruct {
    inner: InnerOptS?;
}

struct InnerOptS {
    x: Int;
    y: String?;
}

contract OptionalStructInsideStruct {
    n: NestedOfOptionalStruct;

    init() {
        self.n = NestedOfOptionalStruct{ inner: null };
    }
}