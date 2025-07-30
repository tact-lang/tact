// Intentionally conflict: provide default + init without assign in init (should be fine)
contract ComplexDefaults {
    x: Int = 5;
    y: Bool = false;
    s: String = "default";

    init() {
        self.y = true;
    }
}