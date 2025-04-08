struct Nested {
    intVal: Int;
    boolVal: Bool;
}

contract OptNestedTest {
    optVal: Nested?;
    init() {
        self.optVal = null;
    }
}