struct DefaultsNestedOpt {
    optVal: Int? = null;
    flag: Bool = false;
    text: String = "hello";
}

contract DefNestedOptFields {
    d: DefaultsNestedOpt;

    init() {
        self.d = DefaultsNestedOpt{};
    }
}