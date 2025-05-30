struct OptionsInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionStruct {
    s: OptionsInStruct? = null;

    init() { self.s = null; }
    receive() { self.s = self.s; }
}