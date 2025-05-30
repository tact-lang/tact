struct Defaulted {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract StructWithDefaults {
    info: Defaulted = Defaulted{};
}