contract NullOptStorage {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    osl: Slice?;
    oa: Address?;

    init() {
        // do not assign optionals
    }

    receive() {
        if (self.oi != null) {
            let _ = self.oi!! + 1;
        }
        if (self.ob != null) {
            let bval: Int = 0;
            if (self.ob!!) { bval = 1; } else { bval = 0; }
            let _ = bval;
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