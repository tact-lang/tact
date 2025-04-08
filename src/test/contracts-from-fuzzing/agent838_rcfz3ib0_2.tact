struct DeepNest {
    sub: Nested;
}

struct Nested {
    boolVal: Bool;
    intVal: Int;
}

contract TestDeepNestedOptional {
    data: DeepNest?;

    init() {
        self.data = null;
    }
}