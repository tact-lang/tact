struct Combo {
    intVal: Int;
    flag: Bool;
    addr: Address;
    cellData: Cell;
    maybeInt: Int?;
    maybeBool: Bool?;
}

contract TestContract {
    combo: Combo;
    
    init() {
        self.combo = Combo{
            intVal: 1,
            flag: true,
            addr: myAddress(),
            cellData: emptyCell(),
            maybeInt: null,
            maybeBool: null
        };
    }
}