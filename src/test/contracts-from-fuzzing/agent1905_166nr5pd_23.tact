struct Inner {
    intVal: Int;
    boolVal: Bool;
}

contract InitDefaultOverride {
    field: Inner;

    init() {
        self.field = Inner{
            intVal: 999,
            boolVal: false,
        };
    }
}