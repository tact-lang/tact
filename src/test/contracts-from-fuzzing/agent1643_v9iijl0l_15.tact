struct InnerManyOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionalFields {
    nestedField: InnerManyOptional;

    init() {
        self.nestedField = InnerManyOptional{
            a: null,
            b: null,
            c: null
        };
    }
}
