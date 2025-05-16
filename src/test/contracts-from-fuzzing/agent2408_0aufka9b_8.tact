struct NestedStructWithOptionals {
    xx: Int?;
    yy: Bool?;
    nested: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract ComplexNestedOptional {
    val: NestedStructWithOptionals;

    init() {
        self.val = NestedStructWithOptionals{
            xx: null,
            yy: null,
            nested: null,
        };
    }
}
