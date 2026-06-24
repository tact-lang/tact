struct OptNest {
    a: Int?;
    b: Bool?;
}

contract OptionalStruct {
    s: OptNest;
    flag: Bool;
    optInt: Int?;

    init() {
        self.s = OptNest{a: null, b: true};
        self.flag = false;
        self.optInt = null;
    }
}