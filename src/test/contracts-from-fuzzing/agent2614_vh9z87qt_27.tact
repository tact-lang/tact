contract NullContract {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;

    init() {
        self.intVal = null;
        self.boolVal = null;
        self.strVal = null;
    }
}