struct ManyDefaults {
    a: Int = 1;
    b: String = "b";
    c: Bool = true;
    d: Int?;
    e: String?;
}

contract DefaultsInit {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{};
    }
}