struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
}

contract DefOptTest {
    data: DefaultOpt;
    init() {
        self.data = DefaultOpt{};
    }
}