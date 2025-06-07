struct DefaultedStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "def";
    d: Int?;  // implicitly default null
}

contract ContractDefaultStructInField {
    s: DefaultedStruct;

    init() {
        self.s = DefaultedStruct{};
    }
}