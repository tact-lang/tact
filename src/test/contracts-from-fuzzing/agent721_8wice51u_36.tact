struct SDefault {
    x: Int = 4;
    y: Bool?;
}

contract ContrWithStructWithDefaults {
    s: SDefault = SDefault{};
}