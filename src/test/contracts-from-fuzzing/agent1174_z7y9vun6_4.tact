struct OptionStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    f: OptionStruct = OptionStruct{ a:null, b:null, c:null };
}