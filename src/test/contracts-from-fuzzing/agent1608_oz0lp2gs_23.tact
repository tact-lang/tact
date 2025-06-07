struct OptionalStruct {
    f1: Int;
    f2: Bool?;
}

contract OptStructInContract {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            f1: 11,
            f2: null
        };
    }
}