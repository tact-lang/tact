struct WithOptional {
    a: Int?;
    b: Bool?;
}

contract OptDefaults {
    field: WithOptional;

    init() {
        self.field = WithOptional{};
    }
}