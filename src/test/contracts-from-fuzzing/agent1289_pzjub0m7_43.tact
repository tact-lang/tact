contract NonNullOptionalDefault {
    maybeNum: Int? = 5;
    maybeBool: Bool? = true;

    init() {
        self.maybeNum = 10;
        self.maybeBool = false;
    }
}