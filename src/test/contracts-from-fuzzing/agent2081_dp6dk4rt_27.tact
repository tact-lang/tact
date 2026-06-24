struct Strange {
    i: Int?;
    b: Bool = true;
    s: String?;
    j: Int = 42;
}

contract OptionalsAndDefaultsStruct {
    val: Strange;
    init() {
        self.val = Strange{
            i:null,
            s:null,
        };
    }
}