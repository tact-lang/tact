contract BasicTypesInit {
    intVal: Int = 3;
    boolVal: Bool = true;
    optionalInt: Int?;
    optionalBool: Bool?;
    stringVal: String = "Hello";

    init() {
        self.optionalInt = 42;
        self.optionalBool = false;
    }
}