contract DefaultsTest {
    intVal: Int = 42;
    boolVal: Bool = true;
    optStr: String?;
    strVal: String = "hi";

    init() {
        self.optStr = null;
    }
}