struct MixedTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
}

contract ManyTypes {
    data: MixedTypes;
    
    init() {
        self.data = MixedTypes{
            intVal: 1,
            boolVal: true,
            strVal: "hi",
            addrVal: myAddress(),
            cellVal: emptyCell()
        };
    }
}