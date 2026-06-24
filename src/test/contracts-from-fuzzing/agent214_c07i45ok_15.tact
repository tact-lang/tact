contract TestContract {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    sliceVal: Slice;
    nullableStr: String?;

    init() {
        self.intVal = -999;
        self.boolVal = false;
        self.stringVal = "abc";
        self.sliceVal = emptyCell().asSlice();
        self.nullableStr = null;
    }
}