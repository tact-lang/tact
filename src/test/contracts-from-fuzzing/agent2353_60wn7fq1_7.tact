struct OptStruct {
    f1: Int?;
    f2: Bool?;
}

contract OptionalNested {
    nested: OptStruct?;

    init() {
        self.nested = null;
    }
}