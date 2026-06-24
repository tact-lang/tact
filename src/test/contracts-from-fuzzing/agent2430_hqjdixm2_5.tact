struct Optionals {
    num: Int?;
    txt: String?;
    addr: Address?;
    flag: Bool?;
}

contract OptVars {
    param: Optionals;

    init() {
        self.param = Optionals{
            num: 10,
            txt: "hi",
            addr: null,
            flag: true
        };
    }
}
