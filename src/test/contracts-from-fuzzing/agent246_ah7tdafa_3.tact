struct WithDefaultOptionals {
    opt1: Int? = null;
    opt2: Bool? = null;
    opt3: String? = null;
}

contract DefaultOptionalFields {
    data: WithDefaultOptionals;

    init() {
        self.data = WithDefaultOptionals{};
    }
}