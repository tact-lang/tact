// Struct with many String fields
struct ManyStrings {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";
    s6: String = "f";
}

contract Stringy {
    field: ManyStrings = ManyStrings{};
    init() {}
}