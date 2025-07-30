struct OptionalStruct {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract TestContract {
    opt: OptionalStruct;

    init() {
        self.opt = OptionalStruct{};
    }
}