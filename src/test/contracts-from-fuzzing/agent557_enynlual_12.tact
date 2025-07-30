struct OptionalWithDefault {
    foo: Int? = null;
    bar: String? = null;
}

contract TestContract {
    dat: OptionalWithDefault;
    init() {
        self.dat = OptionalWithDefault{};
    }
}