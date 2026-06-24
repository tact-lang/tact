struct EmptyDefaults {
    opt: Int?;
    lbl: String?;
}

contract EmptyOpt {
    data: EmptyDefaults;

    init() {
        self.data = EmptyDefaults{};
    }
}