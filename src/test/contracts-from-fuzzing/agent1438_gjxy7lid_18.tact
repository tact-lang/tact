struct MixStrings {
    a: String = "";
    b: String? = null;
    c: String? = "hello";
}

contract TestStringDefaults {
    s: MixStrings = MixStrings{};
}