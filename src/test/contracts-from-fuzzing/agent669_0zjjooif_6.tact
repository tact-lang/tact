struct OptionalDeep {
    inner: Inner?
}

struct Inner {
    val: Int;
    flag: Bool?;
}

contract OptionalNestedStruct {
    nestedOpt: OptionalDeep;

    init() {
        self.nestedOpt = OptionalDeep{
            inner: null
        };
    }
}