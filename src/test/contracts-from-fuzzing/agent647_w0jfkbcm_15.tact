struct OptionalsInStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestContract {
    s: OptionalsInStruct;

    init() {
        self.s = OptionalsInStruct{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}