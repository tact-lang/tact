struct OptionalDeep {
    s: String?;
    addr: Address?;
    inner: InnerStruct?;
}

struct InnerStruct {
    num: Int;
    flag: Bool;
}

contract OptionalNestings {
    storage: OptionalDeep;

    init() {
        self.storage = OptionalDeep{
            s: null,
            addr: null,
            inner: null,
        };
    }
}