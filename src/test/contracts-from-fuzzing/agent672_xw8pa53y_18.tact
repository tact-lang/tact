struct WithDefaultOptionals {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract DefaultNullOptionalTest {
    field: WithDefaultOptionals;
    init() {
        self.field = WithDefaultOptionals{};
    }
}
