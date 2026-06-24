struct OptionalsInStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract OptionalsDeep {
    x: OptionalsInStruct?;

    init() {
        self.x = null;
    }
}