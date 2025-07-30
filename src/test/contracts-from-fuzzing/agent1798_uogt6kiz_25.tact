struct SDefaultOptional {
    x: Int? = null;
    y: String? = null;
}

contract DefaultOptionals {
    data: SDefaultOptional;
    init() {
        self.data = SDefaultOptional{};
    }
}