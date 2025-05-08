struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructField {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: null,
            c: "hello",
        };
    }
}