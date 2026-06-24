struct EmptyOptDefaults {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OnlyNulls {
    val: EmptyOptDefaults;
    init() {
        self.val = EmptyOptDefaults{};
    }
}