struct InnerOpt {
    a: Int?;
}

struct NestedOptional {
    inner: InnerOpt?;
}

contract OptionalInStruct {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner: null };
    }
}
