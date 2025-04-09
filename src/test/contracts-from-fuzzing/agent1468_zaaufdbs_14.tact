contract SeveralPrimitives {
    intVal: Int = 1;
    boolVal: Bool = true;
    stringVal: String = "abc";
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalStr: String?;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalStr = null;
    }
}