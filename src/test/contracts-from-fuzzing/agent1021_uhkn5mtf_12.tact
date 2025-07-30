// Struct with many fields of String? optional type
struct OptStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
    s6: String?;
}

contract OptionalsText {
    strings: OptStrings = OptStrings{
        s1: null, s2: null, s3: null, s4: null, s5: null, s6: null,
    };
}