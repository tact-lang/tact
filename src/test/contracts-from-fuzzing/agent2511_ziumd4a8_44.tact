struct DefaultsInOpt {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultsInOptTest {
    data: DefaultsInOpt;

    init() {
        self.data = DefaultsInOpt{};
    }
}