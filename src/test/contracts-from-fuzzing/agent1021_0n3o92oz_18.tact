contract MixedTypes {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "hi";

    init() {
        self.intVal = 7;
        self.boolVal = false;
        self.strVal = "bye";
    }
}