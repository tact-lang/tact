struct Combo {
    a: Int as int32 = -12345;
    b: Int as uint32 = 67890;
    c: Bool? = true;
    d: Address? = null;
}

contract ComboDefaults {
    data: Combo = Combo{};
}