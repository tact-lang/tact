struct DefaultsOpt {
    val: Int? = 42;
}

contract DefaultsOptTest {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{};
    }
}