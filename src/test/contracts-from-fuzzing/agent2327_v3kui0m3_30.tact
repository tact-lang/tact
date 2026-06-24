struct EmptyOptDefault {
    a: Int?;
    b: String?;
}

contract OptStructTest {
    s: EmptyOptDefault;

    init() {
        self.s = EmptyOptDefault{};
    }
}
