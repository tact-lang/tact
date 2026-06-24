contract OptContract {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;

    init() {
        self.oi = 123;
        self.ob = true;
        self.os = "hello";
        self.oc = emptyCell();
        self.osl = emptyCell().asSlice();
        self.oa = myAddress();
    }

    receive() {
        if (self.oi != null) {
            let _ = self.oi!! + 1;
        }
        if (self.ob != null) {
            let bool_int: Int = 0;
            if (self.ob!!) {
                bool_int = 1;
            } else {
                bool_int = 0;
            }
            let _ = bool_int;
        }
        if (self.os != null) {
            let _ = self.os!!;
        }
        if (self.oc != null) {
            let _ = self.oc!!;
        }
        if (self.osl != null) {
            let _ = self.osl!!;
        }
        if (self.oa != null) {
            let _ = self.oa!!;
        }
    }
}