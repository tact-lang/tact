struct OnlyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOnlyOptionals {
    f: OnlyOptionals;
    init() {
        self.f = OnlyOptionals{};
    }
}