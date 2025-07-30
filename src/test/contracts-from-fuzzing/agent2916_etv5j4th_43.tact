struct OptionalDefaultMixed {
    i: Int? = null;
    s: String? = "z";
    b: Bool? = true;
    a: Address? = null;
}

contract OptionalDefaultMixedContract {
    data: OptionalDefaultMixed;

    init() {
        self.data = OptionalDefaultMixed{};
    }
}