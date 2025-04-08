struct OptionalStruct {
    value: Bool?;
}

contract TestContract {
    opt: OptionalStruct?;

    init() {
        self.opt = OptionalStruct{ value: null };
    }
}