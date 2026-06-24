struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: Address? = null;
}

struct OuterLayer {
    inner: OptDefaults?;
}

contract DefaultsAllOptionals {
    storage: OuterLayer;

    init() {
        self.storage = OuterLayer{};
    }
}