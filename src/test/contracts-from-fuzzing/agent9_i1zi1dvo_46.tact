struct SomeOptional {
    x: Int = 1;
    y: Int? = null;
}

contract OptionalDefaultMix {
    data: SomeOptional;
    init() {
        self.data = SomeOptional{};
    }
}