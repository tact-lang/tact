struct OptionNest {
    value: Int?;
    flag: Bool?;
    optStr: String?;
}

contract WithOptionStruct {
    st: OptionNest;

    init() {
        self.st = OptionNest{
            value: null,
            flag: true,
            optStr: null,
        };
    }
}