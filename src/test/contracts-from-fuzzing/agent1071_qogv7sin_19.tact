struct StrOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract ManyOptionalStruct {
    d: StrOpt;
    init() {
        self.d = StrOpt{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}