// Compose a contract with all major primitive + nullable types
contract MixedPrimitives {
    intVal: Int = 1;
    boolVal: Bool = false;
    strVal: String = "hello";
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    strOpt: String? = null;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.strVal = "bye";
        self.intOpt = 999;
        self.boolOpt = true;
        self.strOpt = "opt";
    }
}