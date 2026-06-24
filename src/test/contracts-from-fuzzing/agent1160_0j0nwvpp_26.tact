contract EdgeCaseMix {
    someInt: Int = 42;
    someOpt: Int?;
    someBool: Bool = false;
    someStr: String = "abc";
    someOptBool: Bool?;

    init() {
        self.someOpt = null;
        self.someOptBool = null;
    }
}