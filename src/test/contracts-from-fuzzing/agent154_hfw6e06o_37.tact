struct WeirdOrder {
    a: Int;
    b: Bool?;
    c: Int;
    d: Bool;
    e: Int?;
}

contract WeirdOrderContract {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{
            a:1, b:null, c:2, d:true, e:null
        };
    }
}