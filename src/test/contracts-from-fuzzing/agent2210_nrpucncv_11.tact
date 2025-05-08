struct MixedOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: Int?;
    f: String?;
}

contract MixedOrdering {
    s: MixedOrder;

    init() {
        self.s = MixedOrder{
            a:1,
            b:true,
            c:"hi",
            d:false,
            e:null,
            f:null
        };
    }
}