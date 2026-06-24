contract NonOptionDefaults {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "hello";
    
    init() {
        self.intVal = 42;
        self.boolVal = false;
        self.strVal = "bye";
    }
}