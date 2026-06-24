struct WeirdOrder {
    a: Int as uint8;
    b: String?;
    c: Bool;
    d: Int;
    e: Bool?;
    f: String;
}

contract WeirdOrdering {
    field: WeirdOrder;
    init() {
        self.field = WeirdOrder{
            a:1, b:null, c:true, d:2, e:false, f:"hi"
        };
    }
}
