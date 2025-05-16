struct Nested {
    a: Int;
    b: Bool;
}

contract DeepOptionalPersistence {
    nestedOpt: Nested?;
    flag: Bool = false;

    init() {
        self.nestedOpt = null;
    }
}