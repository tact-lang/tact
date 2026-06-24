struct WeirdOrder {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Int;
    f: Bool?;
}

contract WeirdOrderContract {
    data: WeirdOrder;
    init() {
        self.data = WeirdOrder{
            a:1,
            b:null,
            c:true,
            d:null,
            e:5,
            f:null
        };
    }
}