contract Test9 {
    intVal: Int as int64;
    uintVal: Int as uint32;
    optVal: Int? as uint256;

    init() {
        self.intVal = 0;
        self.uintVal = 123;
        self.optVal = null;
    }
}