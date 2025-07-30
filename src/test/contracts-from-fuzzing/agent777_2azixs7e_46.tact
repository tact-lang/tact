struct OptionalDefaults2 {
    a: Int? = null;
    b: Bool? = false; // incorrect: cannot default a Bool? to false explicitly
}

contract OptDefaultFail {
    s: OptionalDefaults2;

    init() {
        self.s = OptionalDefaults2{};
    }
}