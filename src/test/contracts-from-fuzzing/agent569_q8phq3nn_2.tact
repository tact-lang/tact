struct Nested {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    stringVal: String;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            intVal: 42,
            boolVal: true,
            cellVal: emptyCell(),
            stringVal: "hi",
        };
    }
}