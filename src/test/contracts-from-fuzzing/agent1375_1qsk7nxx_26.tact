struct InnerMost {
    x: Int;
}

struct Inner {
    y: InnerMost;
}

contract ContractDeepFields {
    z: Inner;

    init() {
        self.z = Inner{y: InnerMost{x: 99}};
    }
}