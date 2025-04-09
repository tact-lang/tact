struct InnerOpts {
    a: Int?;
    b: Bool?;
}

struct OuterDef {
    c: Int = 7;
    d: InnerOpts;
}

contract NestedOptionDefaults {
    val: OuterDef;

    init() {
        self.val = OuterDef{
            d: InnerOpts{a:null,b:null}
        };
    }
}