struct DefaultOpt {
    foo: Int? = null;
}

contract DefaultOptTest {
    s: DefaultOpt;
    init() {
        self.s = DefaultOpt{};
    }
}