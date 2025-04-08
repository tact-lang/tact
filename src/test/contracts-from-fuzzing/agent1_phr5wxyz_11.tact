struct WrappedOptional {
    inner: InnerOptional;
}

struct InnerOptional {
    val: Int?;
}

contract OptionalInStruct {
    some: WrappedOptional;

    init() {
        self.some = WrappedOptional{ inner: InnerOptional{ val: null } };
    }
}
