struct Container {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
}

contract DefaultVals {
    data: Container;

    init() {
        self.data = Container{
            intVal: 0,
            strVal: "",
            boolVal: false,
            addrVal: myAddress(),
            cellVal: emptyCell(),
        };
    }
}