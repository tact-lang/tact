struct EmptyOptDefaults {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract StructOptDefaultsTest {
    d: EmptyOptDefaults;
    init() {
        self.d = EmptyOptDefaults{};
    }
}