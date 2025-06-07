struct IntStruct {
    x: Int;
}

struct NestedOptionals {
    a: Int?;
    b: IntStruct?;
}

contract NestedOptionalFields {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{a: null, b: null};
    }
}