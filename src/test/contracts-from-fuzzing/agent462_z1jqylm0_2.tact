struct NestedOptionals {
    flag: Bool;
    maybeNumber: Int?;
    maybeString: String?;
    maybeNested: AnotherStruct?;
}

struct AnotherStruct {
    value: Int;
    text: String;
}

contract StructWithManyOptionals {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            flag: true,
            maybeNumber: null,
            maybeString: null,
            maybeNested: null
        };
    }
}