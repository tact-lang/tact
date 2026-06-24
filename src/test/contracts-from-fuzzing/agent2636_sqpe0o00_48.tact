struct OptionalWithDefault {
    oi: Int? = null;
}

contract OptWithDef {
    val: OptionalWithDefault;

    init() {
        self.val = OptionalWithDefault{};
    }
}