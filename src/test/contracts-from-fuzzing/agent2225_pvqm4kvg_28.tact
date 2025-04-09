struct DefOpt {
    x: Int? = null;
    y: Int?;
}

contract OptionalDefaultStruct {
    data: DefOpt;

    init() {
        self.data = DefOpt{};
    }
}