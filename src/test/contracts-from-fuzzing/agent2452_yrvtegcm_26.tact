contract MixedOptionals {
    flag: Bool? = null;
    count: Int = 0;
    optionalInt: Int? = null;
    init() {
        self.flag = null;
        self.count = 42;
        self.optionalInt = null;
    }
}