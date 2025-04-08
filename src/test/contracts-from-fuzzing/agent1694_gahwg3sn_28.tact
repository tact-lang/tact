struct DefaultOpt {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultOptTest {
    val: DefaultOpt;

    init() {
        self.val = DefaultOpt{};
    }
}