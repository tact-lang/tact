struct OptionPair {
    a: Int?;
    b: Bool?;
}

contract OptionalDefaultFields {
    f: OptionPair = OptionPair{ a:null, b:null };
}