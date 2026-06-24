contract TestContract {
    intVal: Int;
    int32Val: Int as uint32;
    boolVal: Bool;
    optIntVal: Int?;
    stringVal: String;

    init() {
        self.intVal = 5;
        self.int32Val = 10;
        self.boolVal = true;
        self.optIntVal = null;
        self.stringVal = "test";
    }
}