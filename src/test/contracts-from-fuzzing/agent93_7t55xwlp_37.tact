struct StructWithOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract ContractOptDefaults {
    f: StructWithOptDefaults = StructWithOptDefaults{};
}