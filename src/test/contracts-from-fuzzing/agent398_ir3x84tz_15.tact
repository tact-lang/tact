struct OptRefs {
    optStr: String?;
    optAddr: Address?;
}

contract OptionalReferences {
    refs: OptRefs;

    init() {
        self.refs = OptRefs{ optStr: null, optAddr: null };
    }
}