struct DefaultOpt {
    f1: Int? = null;
    f2: Bool? = null;
}

contract OptDefaults {
    optStruct: DefaultOpt;

    init() {
        self.optStruct = DefaultOpt{};
    }
}