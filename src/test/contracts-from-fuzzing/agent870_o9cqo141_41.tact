struct SOptDefaults {
    a: Int?; // defaults to null
    b: Bool?;
    c: String?;
}

contract SOptNullFill {
    data: SOptDefaults;
    init() {
        self.data = SOptDefaults{};
    }
}