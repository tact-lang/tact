struct OptionalDeep {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract TestOptionalDeep {
    data: OptionalDeep = OptionalDeep{};
    init() {}
}