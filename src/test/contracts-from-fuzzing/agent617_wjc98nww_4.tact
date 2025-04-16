struct OptionalNest {
    flag: Bool?;
    note: String?;
    cellData: Cell?;
    addr: Address?;
    intVal: Int?;
}

contract OptFields {
    s: OptionalNest;
    init() {
        self.s = OptionalNest{
            flag: null,
            note: null,
            cellData: null,
            addr: null,
            intVal: null
        };
    }
}
