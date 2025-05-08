struct EmptyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalDefault {
    field: EmptyOptionals;

    init() {
        self.field = EmptyOptionals{};
    }
}