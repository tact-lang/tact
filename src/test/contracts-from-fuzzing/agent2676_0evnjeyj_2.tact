contract MixedPrimitives {
    intVal: Int as int64 = 10;
    uintVal: Int as uint32 = 20;
    boolVal: Bool = true;
    strVal: String = "hello";
    optBool: Bool? = null;

    init() {
        self.intVal = -100;
        self.uintVal = 4294967295;
        self.boolVal = false;
        self.strVal = "world";
        self.optBool = true;
    }
}