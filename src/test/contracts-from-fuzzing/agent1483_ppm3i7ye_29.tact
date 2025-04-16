struct OptionalIntDefaults {
    x: Int? = null;
    y: Int? = null;
    z: Int? = null;
}

contract OptionalDefaultsCombine {
    opt: OptionalIntDefaults;

    init() {
        self.opt = OptionalIntDefaults{};
    }
}