struct OptionalInDefaultStruct {
    x: Int? = null;
}

contract OptionalInDefault {
    s: OptionalInDefaultStruct;

    init() {
        self.s = OptionalInDefaultStruct{};
    }
}