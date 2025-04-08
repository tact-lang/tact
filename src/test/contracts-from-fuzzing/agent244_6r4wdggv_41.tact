struct OnlyDefaultOptional {
    a: Int? = null;
    b: Bool? = null;
}

contract DefaultOptCombination {
    f: OnlyDefaultOptional;

    init() {
        self.f = OnlyDefaultOptional{};
    }
}