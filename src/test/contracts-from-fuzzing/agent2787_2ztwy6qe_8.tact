struct OptionalStruct {
    f1: Int;
    f2: Bool?;
    f3: String?;
}

contract TestContract {
    sOpt: OptionalStruct?;

    init() {
        self.sOpt = OptionalStruct{
            f1: 1,
            f2: null,
            f3: "hi"
        };
    }
}
