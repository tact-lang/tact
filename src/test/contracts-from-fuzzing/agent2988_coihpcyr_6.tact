struct Defaults {
    intField: Int = 42;
    boolField: Bool = false;
    strField: String = "hi";
}

contract DefaultStructValues {
    data: Defaults;
    init() {
        self.data = Defaults{}; // only defaults
    }
}