struct WithOptional {
    s: String?;
    b: Bool?;
}

contract OptionalDefaults {
    field: WithOptional;

    init() {
        self.field = WithOptional{};
    }
}
