struct PrimitiveMix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract TestStorage {
    persistentInt: Int = 42;
    persistentBool: Bool = true;
    persistentString: String = "hello";
    persistentStruct: PrimitiveMix;

    init() {
        self.persistentStruct = PrimitiveMix{
            intVal: 123,
            boolVal: false,
            strVal: "world"
        };
    }
}