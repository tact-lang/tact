struct Nested {
    innerValue: Int;
    flag: Bool;
}

contract StructInContract {
    nested: Nested;

    init() {
        self.nested = Nested { innerValue: 7, flag: true };
    }
}