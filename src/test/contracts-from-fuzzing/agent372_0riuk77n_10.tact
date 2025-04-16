struct SDefault {
    optionalFlag: Bool?; // defaults implicitly to null
    x: Int = 123;
}

contract StructOptionalDefault {
    storage: SDefault;

    init() {
        self.storage = SDefault{};
    }
}