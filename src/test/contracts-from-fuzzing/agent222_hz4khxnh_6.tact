struct NestedOptionalField {
    a: Int?;
}

struct Wrapper {
    nested: NestedOptionalField;
}

contract NestedOptionalPersist {
    s: Wrapper = Wrapper{nested: NestedOptionalField{a: null}};

    receive() {
        self.s = Wrapper{nested: NestedOptionalField{a: 789}};
    }
}