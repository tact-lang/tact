struct ManyOptDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: String?;
}

contract ManyDefaults {
    data: ManyOptDefaults;

    init() {
        self.data = ManyOptDefaults{ };
    }
}