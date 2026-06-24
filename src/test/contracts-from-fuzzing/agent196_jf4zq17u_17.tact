contract MixedDefaults {
    intVal: Int = 10;
    boolVal: Bool;
    strVal: String = "hi";

    init() {
        self.boolVal = true;
    }
}