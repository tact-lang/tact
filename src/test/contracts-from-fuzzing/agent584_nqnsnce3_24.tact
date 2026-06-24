struct OptionSerialize {
    a: Int? as uint32;
    b: Bool?;
    c: String?;
}

contract Test {
    s: OptionSerialize = OptionSerialize{ a: null, b: null, c: null };
}