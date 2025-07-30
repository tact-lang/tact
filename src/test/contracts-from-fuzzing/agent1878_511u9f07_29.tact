struct Flags {
    enabled: Bool = true;
    limit: Int?;
}

contract Test {
    f: Flags;

    init() {
        self.f = Flags{};
    }
}