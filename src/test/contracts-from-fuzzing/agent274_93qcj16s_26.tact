struct IntStringBool {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
}

contract MultiPrimTest {
    x: IntStringBool;

    init() {
        self.x = IntStringBool{
            intVal: 2147483647,
            strVal: "max",
            boolVal: true,
        };
    }
}