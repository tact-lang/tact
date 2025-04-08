struct EmptyDefaults {
    val: Int?;  // default to null
    txt: String?; // default to null
    flg: Bool?;  // default to null
}

contract AllNull {
    ff: EmptyDefaults;
    init() {
        self.ff = EmptyDefaults{};
    }
}