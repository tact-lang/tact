struct NestedOptionals {
    s: InnerStruct?;
}

struct InnerStruct {
    a: Int?;
    b: Bool?;
    str: String?;
}

contract TestContract {
    field: NestedOptionals;

    init() {
        self.field = NestedOptionals{ s: null };
    }
}
