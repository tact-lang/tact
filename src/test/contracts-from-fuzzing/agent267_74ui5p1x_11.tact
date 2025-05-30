struct Compose {
    intVal: Int;
    boolVal: Bool;
}

contract NestedInst {
    field: Compose;

    init() {
        self.field = Compose{
            intVal: 555,
            boolVal: false
        };
    }
}