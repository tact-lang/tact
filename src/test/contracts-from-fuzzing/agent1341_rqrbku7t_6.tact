struct NestedOptional {
    a: Int?;
    b: String?;
    c: Address?;
}

contract OptionalStructField {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: null,
            c: null,
        };
    }
}