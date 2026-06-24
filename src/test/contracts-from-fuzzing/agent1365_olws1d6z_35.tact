struct WithOptionalString {
    txt: String?;
}

contract NestedOptString {
    nested: WithOptionalString;

    init() {
        self.nested = WithOptionalString{ txt: null };
    }
}