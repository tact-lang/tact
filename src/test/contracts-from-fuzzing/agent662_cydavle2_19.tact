contract MixedScalars {
    intVal: Int as int64;
    uintVal: Int as uint16;
    boolVal: Bool;
    stringVal: String;
    optVal: Int?;

    init() {
        self.intVal = -12345678;
        self.uintVal = 65535;
        self.boolVal = false;
        self.stringVal = "mixing";
        self.optVal = null;
    }
}