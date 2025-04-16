// Many optional primitives in contract storage
contract TestContract {
    iOpt: Int?;
    bOpt: Bool?;
    sOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;

    init() {
        self.iOpt = null;
        self.bOpt = null;
        self.sOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
    }

    receive() {
        if (self.iOpt != null) {
            let _ = self.iOpt!!;
        }
    }
}