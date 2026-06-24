struct OptionStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionPersist {
    st: OptionStruct;

    init() {
        self.st = OptionStruct{ a: null, b: null, c: null };
    }
}