struct NestedOptional {
    v: Int?;
}

contract NestedNullField {
    f: NestedOptional?;

    init() {
        self.f = null;
    }
}