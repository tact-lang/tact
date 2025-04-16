struct EmptyOptionalDefaults {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    f: EmptyOptionalDefaults;

    init() {
        self.f = EmptyOptionalDefaults{};
    }
}