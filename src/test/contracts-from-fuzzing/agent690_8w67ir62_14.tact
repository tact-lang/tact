struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract DefaultOptionalTest {
    d: DefaultOpt;

    init() {
        self.d = DefaultOpt{};
    }
}