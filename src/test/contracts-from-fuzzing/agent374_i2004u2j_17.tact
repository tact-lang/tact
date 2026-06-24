struct OptionalDeep {
    nestedOpt: Inner?;
    flagOpt: Bool?;
}

struct Inner {
    fooOpt: Int?;
    boolVal: Bool;
}

contract TestContract {
    od: OptionalDeep;

    init() {
        self.od = OptionalDeep{
            nestedOpt: null,
            flagOpt: null
        };
    }

    receive() {
        if (self.od.nestedOpt != null) {
            if (self.od.nestedOpt!!.fooOpt != null) {
                let _ = self.od.nestedOpt!!.fooOpt!!;
            }
        }
    }
}