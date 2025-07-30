struct OptionalsInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructStorage {
    opt: OptionalsInStruct;

    init() {
        self.opt = OptionalsInStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}