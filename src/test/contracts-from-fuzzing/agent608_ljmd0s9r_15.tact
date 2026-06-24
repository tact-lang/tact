struct NestedOptStruct {
    a: Int?;
    b: String?;
}

struct NestedContainer {
    first: NestedOptStruct;
    second: NestedOptStruct?;
}

contract OptionalAndNested {
    s: NestedContainer?;

    init() {
        self.s = null;
    }
}
