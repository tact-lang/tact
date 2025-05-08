struct Defaults {
    a: Int = 1;
    b: Int?; // default null
    c: Bool = false;
    d: Bool?; // default null
    e: String = "hi";
    f: String?; // default null
}

contract WithDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}