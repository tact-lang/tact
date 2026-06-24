struct BigDefaults {
    x: Int = 123456789012345678901234567890;
    s: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
}

contract HugeDefaultValues {
    a: Int = 999999999999999999999999999;
    b: String = "The quick brown fox jumps over the lazy dog.";
    c: BigDefaults = BigDefaults{};

    init() {
        // override none, defaults only
    }
}