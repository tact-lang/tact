struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "ok";
    d: Int?; // null implicit
    e: Bool?; // null implicit
    f: String?; // null implicit
}

contract DefsTogether {
    field: ManyDefaults;

    init() {
        self.field = ManyDefaults{};
    }
}
