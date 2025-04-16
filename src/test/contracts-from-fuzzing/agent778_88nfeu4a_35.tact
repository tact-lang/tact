contract OptionalAssignedMix {
    a: Int? = null;
    b: Bool? = null;

    init() {
        self.a = 42;
        self.b = true;
    }
}