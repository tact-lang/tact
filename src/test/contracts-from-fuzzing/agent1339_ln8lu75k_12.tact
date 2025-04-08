struct OnlyOptional {
    a: Int?;
    b: String?;
}

contract AllDefaultToNull {
    f: OnlyOptional;

    init() {
        self.f = OnlyOptional{};
    }
}