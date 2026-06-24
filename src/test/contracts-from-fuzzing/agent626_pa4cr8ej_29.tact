struct HasDefaultOptional {
    a: Int? = null;
    b: Bool? = null;
}

contract DefaultOptVals {
    x: HasDefaultOptional;

    init() {
        self.x = HasDefaultOptional{};
    }
}