struct EmptyStringDefault {
    val: String = "";
}

contract EmptyStringInStruct {
    f: EmptyStringDefault;

    init() {
        self.f = EmptyStringDefault{};
    }
}