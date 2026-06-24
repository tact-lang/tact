struct DefaultOptional {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultOptInStruct {
    val: DefaultOptional;

    init() {
        self.val = DefaultOptional{};
    }
}