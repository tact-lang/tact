contract Test41 {
    intVal: Int as uint64 = 42;
    boolVal: Bool = true;
    strVal: String = "q";

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.strVal = "zz";
    }
}