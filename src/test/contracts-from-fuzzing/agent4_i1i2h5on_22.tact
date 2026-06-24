struct MaybeEmpty {
    x: Int? = null;
    y: Bool? = null;
}

contract TestContract {
    m: MaybeEmpty;

    init() {
        self.m = MaybeEmpty{};
    }
}
