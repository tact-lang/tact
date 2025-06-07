struct OnlyOpts {
    a: Int?;
    b: Bool?;
}

contract AllNulls {
    data: OnlyOpts;
    init() {
        self.data = OnlyOpts{};
    }
}
