struct WithOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptDefaults {
    w: WithOptionals;

    init() {
        self.w = WithOptionals{};
    }
}