struct OptionalWithDefault {
    val: Int? = null;
}

contract OptionalDefaultContract {
    opt: OptionalWithDefault;

    init() {
        self.opt = OptionalWithDefault{};
    }
}