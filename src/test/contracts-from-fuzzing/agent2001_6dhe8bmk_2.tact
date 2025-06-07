struct DeepOptional {
    a: Int?;
    b: Bool;
    c: String?;
}

contract NestedOptionalField {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            a: null,
            b: true,
            c: null,
        };
    }
}