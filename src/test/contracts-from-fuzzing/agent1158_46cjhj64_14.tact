struct StrUse {
    s: String;
}

contract BigStringDefault {
    data: StrUse;

    init() {
        self.data = StrUse{ s: "This is a quite a long string, used as default or test field." };
    }
}
