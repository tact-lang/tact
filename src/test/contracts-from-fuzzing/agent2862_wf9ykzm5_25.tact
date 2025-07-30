struct Defaulted {
    a: Int = 1;
    b: String = "x";
    c: Bool = true;
}

contract StructWithDefaults {
    d: Defaulted = Defaulted{};
}