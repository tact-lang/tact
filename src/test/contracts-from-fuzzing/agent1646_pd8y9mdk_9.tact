struct OptDeeper {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    inner: OptDeeper?;
}

contract NestedOptionalStruct {
    state: OuterOpt;
    init() {
        self.state = OuterOpt{ inner: null };
    }
}