struct StringsDefaults {
    s1: String;
    s2: String = "abc";
    s3: String = "def";
}

contract DefaultsPersist {
    data: StringsDefaults = StringsDefaults{ s1: "required" };
}