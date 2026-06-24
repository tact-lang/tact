// test struct with many optional primitives
struct OptPrim {
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oa: Address?;
}

contract TestOptPrims {
    data: OptPrim = OptPrim{oi:null, ob:null, os:null, oc:null, oa:null};

    init() {
        self.data = OptPrim{oi:1, ob:true, os:"s", oc:emptyCell(), oa:myAddress()};
    }
}
