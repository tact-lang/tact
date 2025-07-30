struct NestedOptionalBool {
    flag: Bool?;
}

contract NestedWithOptionalBool {
    nested: NestedOptionalBool = NestedOptionalBool{ flag: null };

    init() {
        self.nested = NestedOptionalBool{ flag: true };
    }
}