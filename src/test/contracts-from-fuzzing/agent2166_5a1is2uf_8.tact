struct HasOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract ComplexOptionals {
    field: HasOptionals;

    init() {
        self.field = HasOptionals{
            a: null,
            b: null,
            s: "hello"
        };
    }
}
