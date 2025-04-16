contract OptionalMix {
    intVal: Int as int64;
    boolVal: Bool;
    maybeInt: Int?;
    maybeFlag: Bool?;

    init() {
        self.intVal = 1000;
        self.boolVal = true;
        self.maybeInt = null;
        self.maybeFlag = false;
    }
}