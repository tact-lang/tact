struct OptionalStruct {
    field1: Int?;
    field2: String?;
}

contract TestContract {
    opt: OptionalStruct = OptionalStruct{};

    init() {
        self.opt = OptionalStruct{};
    }
}