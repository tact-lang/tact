struct Composite {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optVal: Int?;
}

contract TestContract {
    field: Composite;

    init() {
        self.field = Composite {
            intVal: 42,
            boolVal: true,
            strVal: "hello",
            optVal: null
        };
    }
}