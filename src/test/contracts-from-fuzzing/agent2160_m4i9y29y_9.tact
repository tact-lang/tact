struct InnerWithDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "ok";
}

contract DefaultsContract {
    f: InnerWithDefaults;

    init() {
        self.f = InnerWithDefaults{};
    }
}