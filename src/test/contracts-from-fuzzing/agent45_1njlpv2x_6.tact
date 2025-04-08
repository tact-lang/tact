struct DefaultOptionals {
    a: Int?;
    b: Bool?;
}

contract DefaultOptionalFields {
    nested: DefaultOptionals;

    init() {
        self.nested = DefaultOptionals{};
    }
}
