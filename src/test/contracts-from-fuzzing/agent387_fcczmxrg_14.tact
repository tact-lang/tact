struct Inner {
    s1: String? = null;
    s2: String? = "world";
}

contract PartialNestedDefaults {
    inner: Inner = Inner{
        // omit both: s1 should be null (explicit default null), s2 = "world"
    };
}