struct StructWithDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "default";
}
contract SWD {
    data: StructWithDefaults = StructWithDefaults{};
}