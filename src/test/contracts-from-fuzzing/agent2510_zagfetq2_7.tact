contract DefaultsOptional {
    foo: Int = 5;
    bar: String = "abc";
    flag: Bool = true;
    optInt: Int?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optStr = null;
    }
}