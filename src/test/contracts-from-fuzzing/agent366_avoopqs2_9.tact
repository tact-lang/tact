struct BigOptional {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptDefaults {
    val: BigOptional;
    init() {
        self.val = BigOptional{};
    }
}