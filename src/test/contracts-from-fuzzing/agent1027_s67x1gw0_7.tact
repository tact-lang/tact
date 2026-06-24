contract BoolAndInt {
    flag: Bool = true;
    number: Int = 123;
    optional: Bool?;
    optionalInt: Int?;

    init() {
        self.optional = null;
        self.optionalInt = null;
    }
}