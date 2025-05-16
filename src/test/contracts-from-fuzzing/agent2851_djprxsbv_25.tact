struct NestedOptionalStruct {
    a: Int?;
    b: Bool?;
}

struct ContainsNullable {
    inner: NestedOptionalStruct?;
    c: Int;
}

contract OptionalInsideOptional {
    data: ContainsNullable;

    init() {
        self.data = ContainsNullable{
            inner: null,
            c: 42
        };
    }
}
