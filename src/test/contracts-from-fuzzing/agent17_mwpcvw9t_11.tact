struct SDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract StructFieldDefaults {
    val: SDefaults = SDefaults{};
}