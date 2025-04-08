struct OptionalsDeep {
    a: Bool?;
    b: Int?;
    c: String?;
    d: Address?;
}

contract ManyOptionalFields {
    opts: OptionalsDeep = OptionalsDeep{ a: null, b: null, c: null, d: null };
}