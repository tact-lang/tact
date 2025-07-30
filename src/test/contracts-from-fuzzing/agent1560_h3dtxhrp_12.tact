struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;
}

contract TestContract {
    s: ManyDefaults = ManyDefaults{};
}