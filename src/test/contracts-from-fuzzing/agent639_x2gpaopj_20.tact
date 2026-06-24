struct DefaultOptional {
    val: Int? = null;
    flag: Bool? = false;
}

contract DefaultOptInStruct {
    d: DefaultOptional;
    init() {
        self.d = DefaultOptional{};
    }
}