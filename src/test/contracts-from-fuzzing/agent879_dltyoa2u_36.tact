struct MixedOptionalTypes {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Slice?;
}

contract MixedOptionalTypesTest {
    s: MixedOptionalTypes;

    init() {
        self.s = MixedOptionalTypes{};
    }
}
