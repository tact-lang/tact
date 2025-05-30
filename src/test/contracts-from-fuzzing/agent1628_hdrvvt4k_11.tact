contract TestContract {
    flag: Bool = true;
    optionalInt: Int? = null;
    optionalBool: Bool? = null;

    init() {
        self.optionalInt = 42;
        self.optionalBool = true;
    }
}