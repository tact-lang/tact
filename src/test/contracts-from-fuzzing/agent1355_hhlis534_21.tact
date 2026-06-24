contract MixedPrimitives {
    intVal: Int = 10;
    boolVal: Bool = true;
    strVal: String = "test";
    optI: Int?;
    optB: Bool?;
    optS: String?;
    
    init() {
        self.optI = null;
        self.optB = null;
        self.optS = null;
    }

    receive() {}
}