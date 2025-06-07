struct OptionalStr {
    s: String? = "hi";
}

contract OptStrDefault {
    stored: OptionalStr = OptionalStr{};
    init() {}
}