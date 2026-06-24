struct BigOptionals {
    oa: Int?;
    ob: Bool?;
    oc: String?;
    od: Cell?;
    oe: Slice?;
}

contract LotsOfOptsInStruct {
    s: BigOptionals;

    init() {
        self.s = BigOptionals{
            oa:null,ob:null,oc:null,od:null,oe:null
        };
    }
}