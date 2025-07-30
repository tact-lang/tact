struct OptStruct {
    inner: Int?;
    flag: Bool;
}

contract OptDefault {
    s: OptStruct;

    init() {
        self.s = OptStruct{ inner: null, flag: true };
    }
}