contract OptionalWithDefault {
    maybeNumber: Int? = null;
    maybeBool: Bool? = null;

    init() {
        self.maybeNumber = 42;
        self.maybeBool = true;
    }
}