struct DefaultsOpt {
    optInt: Int? = null;
    optStr: String? = null;
    flag: Bool = false;
}

contract DefaultsOptTest {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{};
    }
}