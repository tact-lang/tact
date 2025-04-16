struct DefaultsOpt {
    a: Int = 5;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = true;
    s: String = "hi";
    so: String? = null;
}

contract DefaultsOptTest {
    s: DefaultsOpt;

    init() {
        self.s = DefaultsOpt{};
    }
}
