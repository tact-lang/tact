struct MultipleStringDefaults {
    s1: String = "abc";
    s2: String = "def";
    s3: String = "ghi";
}

contract MultipleStrings {
    v: MultipleStringDefaults = MultipleStringDefaults{};
}
