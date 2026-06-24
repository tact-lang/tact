struct HasPrimitiveDefaults {
    n: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract PrimDefaultsContract {
    storage: HasPrimitiveDefaults;

    init() {
        self.storage = HasPrimitiveDefaults{};
    }
}