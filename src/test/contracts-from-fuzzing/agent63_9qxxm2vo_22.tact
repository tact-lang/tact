struct MixedOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: String?;
    e: Int;
    f: Bool?;
}

contract IrregularStruct {
    stuff: MixedOrder;

    init() {
        self.stuff = MixedOrder{
            a:1, b:null, c:"hi", d:null, e:5, f:null
        };
    }
}