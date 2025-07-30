struct Compose {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
}

contract CompFields {
    data: Compose;

    init() {
        self.data = Compose{
            intVal: 5,
            boolVal: false,
            strVal: "str",
            cellVal: emptyCell(),
        };
    }
}
