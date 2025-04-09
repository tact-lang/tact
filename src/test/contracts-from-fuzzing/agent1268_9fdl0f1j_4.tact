struct OptionalNestedStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract OptionalsContract {
    opt: OptionalNestedStruct?;

    init() {
        self.opt = null;
    }
}