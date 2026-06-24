struct DefaultString {
    s: String = "default";
}

contract InitDefaultStr {
    f: DefaultString = DefaultString{};
}