contract ManyTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optVal: Int?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "text";
        self.optVal = null;
    }
}