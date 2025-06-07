struct Info {
    f: Int;
    flag: Bool;
}

contract OptionalStruct {
    s: Info?;

    init() {
        self.s = null;
    }
}