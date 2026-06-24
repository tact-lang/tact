contract DefaultPrimitives {
    count: Int = 0;
    flag: Bool = false;
    name: String = "";
    optionalVal: Int?;

    init() {
        self.count = 42;
        self.flag = true;
        self.name = "abc";
        self.optionalVal = null;
    }
}