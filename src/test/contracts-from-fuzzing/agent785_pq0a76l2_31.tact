// Compose contract fields with nested struct default values
struct Inner {
    x: Int = 7;
    y: Bool = false;
}

contract DefaultsNested {
    f: Inner = Inner{};
    init() {
        self.f = Inner{ x: 42, y: true };
    }
}
