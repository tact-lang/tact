struct NullDefaults {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestStorage {
    vals: NullDefaults;

    init() {
        self.vals = NullDefaults{};
    }
}