struct OptionalInNested {
    inner: Int?;
    flag: Bool;
}

contract NestedOptionalContract {
    nestedOpt: OptionalInNested?;
    init() {
        self.nestedOpt = null;
    }
}