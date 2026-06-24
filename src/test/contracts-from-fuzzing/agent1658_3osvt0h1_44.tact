struct DefaultOptS {
    flag: Bool? = null;
}

contract DefaultedOptStruct {
    s: DefaultOptS;

    init() {
        self.s = DefaultOptS{};
    }
}