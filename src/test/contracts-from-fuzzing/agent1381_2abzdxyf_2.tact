struct OptionalNest {
    inner: Int?;
    flag: Bool;
}

contract TestContract {
    nested: OptionalNest;

    init() {
        self.nested = OptionalNest{ inner: null, flag: false };
    }
}