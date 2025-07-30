contract OptionalMix {
    intVal: Int?;
    intVal2: Int = 5;
    boolVal: Bool?;
    boolVal2: Bool = true;
    stringVal: String?;
    stringVal2: String = "hello";

    init() {
        self.intVal=10;
        self.intVal2=20;
        self.boolVal=false;
        self.boolVal2=true;
        self.stringVal="foo";
        self.stringVal2="bar";
    }
}
