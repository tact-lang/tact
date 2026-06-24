contract ComplexMixed {
    count: Int;
    flag: Bool;
    optS: String?;
    message: String;
    flag2: Bool;
    someNum: Int;

    init() {
        self.count = 42;
        self.flag = true;
        self.optS = null;
        self.message = "Hello";
        self.flag2 = false;
        self.someNum = -7;
    }
}
