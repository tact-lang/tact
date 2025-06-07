struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: AnotherStruct?;
}

struct AnotherStruct {
    z: Int;
    y: Int?;
}

contract TestContract {
    field: NestedOptionals;

    init() {
        self.field = NestedOptionals{
            a: null,
            b: null,
            c: null,
        };
    }
}