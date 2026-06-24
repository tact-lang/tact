struct NestedStringOpt {
    foo: String?;
}

struct MiddleLevel {
    inner: NestedStringOpt;
}

contract ContractMiddleOptional {
    f: MiddleLevel?;

    init() {
        self.f = null;
    }
}