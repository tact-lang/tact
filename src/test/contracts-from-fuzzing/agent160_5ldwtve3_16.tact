struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    stringVal: String;
}

contract TestManyTypes {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            intVal: 1,
            boolVal: false,
            addrVal: myAddress(),
            cellVal: emptyCell(),
            stringVal: "hello",
        };
    }
}