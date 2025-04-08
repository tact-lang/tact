struct JustBool {
    flag: Bool = true;
}

contract SingleBoolStruct {
    s: JustBool;

    init() {
        self.s = JustBool{};
    }
}