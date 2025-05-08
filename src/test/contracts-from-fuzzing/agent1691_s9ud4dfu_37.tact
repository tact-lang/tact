struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultOptTest {
    val: DefaultOpt;

    init() {
        self.val = DefaultOpt{};
    }
}