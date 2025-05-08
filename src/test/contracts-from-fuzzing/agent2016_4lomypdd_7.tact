struct OptionalStruct {
    flag: Bool?;
    num: Int?;
    str: String?;
}

contract Test {
    opt: OptionalStruct;
    init() {
        self.opt = OptionalStruct{
            flag: null,
            num: null,
            str: null
        };
    }
}