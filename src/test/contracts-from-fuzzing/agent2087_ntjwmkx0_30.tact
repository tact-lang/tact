struct Innermost {
    foo: Int?;
}

struct LayeredOpt {
    inner: Innermost?;
}

contract NullableChain {
    f: LayeredOpt;

    init() {
        self.f = LayeredOpt{inner: null};
    }
}