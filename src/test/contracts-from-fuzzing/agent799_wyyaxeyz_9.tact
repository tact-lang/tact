struct OptionalNest {
    inner: Int?;
    flag: Bool;
}

struct OuterOpt {
    nested: OptionalNest?;
    number: Int;
}

contract OptOnStruct {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}