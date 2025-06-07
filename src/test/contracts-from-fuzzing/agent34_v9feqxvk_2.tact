struct NestedLevel {
    innerFlag: Bool;
}

contract NestedContract {
    nested: NestedLevel;

    init() {
        self.nested = NestedLevel{ innerFlag: false };
    }
}