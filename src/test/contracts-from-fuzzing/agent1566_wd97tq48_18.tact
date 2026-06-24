struct DefaultOptional {
    x: Int? = null;
    y: String? = null;
}

contract DefaultOptTest {
    s: DefaultOptional;

    init() {
        self.s = DefaultOptional{};
    }
}
