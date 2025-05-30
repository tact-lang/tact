struct DefNestedOpt {
    num: Int? = null;
    word: String = "";
}

contract DefaultsAndOptionals {
    optNested: DefNestedOpt;

    init() {
        self.optNested = DefNestedOpt{};
    }
}