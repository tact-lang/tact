// contract with optional bool with explicit false default
contract OptionalBoolDefault {
    flag: Bool? = null;

    init() {
        self.flag = null;
    }
}