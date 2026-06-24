// Contract with many optional fields, some defaulted
contract TestContract {
    oa: Int?;
    ob: Bool?;
    oc: String?;
    od: Address?;
    oe: Cell?;
    of: Slice?;

    init() {
        self.oa = 1;
        self.ob = false;
        self.oc = "hey";
        self.od = null;
        self.oe = emptyCell();
        self.of = emptyCell().asSlice();
    }

    receive() {
        if (self.od != null) {
            let _ = self.od!!;
        }
    }
}