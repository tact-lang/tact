struct BadDefaultOptional {
    x: Int? = 123;
}

contract InvalidOptDefault {
    f: BadDefaultOptional;
    init() {
        self.f = BadDefaultOptional{};
    }
}