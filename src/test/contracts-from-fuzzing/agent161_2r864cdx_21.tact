struct StringOptFields {
    s1: String?;
    s2: String?;
}

contract OptionalStrings {
    val: StringOptFields = StringOptFields{ s1: null, s2: null };

    init() {}

    receive() {}
}