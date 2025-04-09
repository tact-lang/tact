struct OneBool {
    flag: Bool;
}

contract OptionalStruct {
    s: OneBool?;

    init() {
        self.s = null;
    }
}