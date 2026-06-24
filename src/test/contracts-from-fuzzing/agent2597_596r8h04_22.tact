struct OnlyOptional {
    value: Int?;
}

contract UninitOptional {
    st: OnlyOptional;

    init() {
        self.st = OnlyOptional{};
    }
}