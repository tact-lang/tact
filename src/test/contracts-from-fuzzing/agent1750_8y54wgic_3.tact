struct OptionalNest {
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
}

contract OptionalDeep {
    state: OptionalNest;

    init() {
        self.state = OptionalNest{ inner: null };
    }
}