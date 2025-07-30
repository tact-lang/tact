struct OptionalCellStruct {
    c1: Cell?;
    c2: Cell?;
    c3: Cell?;
}

contract OptCellFields {
    val: OptionalCellStruct;
    init() {
        self.val = OptionalCellStruct{
            c1:null, c2:null, c3:null
        };
    }
}