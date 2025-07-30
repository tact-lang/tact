// Contract with optional persistent fields of every primitive type
contract StorageTest {
    intv: Int?;
    boolv: Bool?;
    strv: String?;
    addrv: Address?;
    cellv: Cell?;
    slicev: Slice?;

    init() {
        self.intv = null;
        self.boolv = null;
        self.strv = null;
        self.addrv = null;
        self.cellv = null;
        self.slicev = null;
    }
}