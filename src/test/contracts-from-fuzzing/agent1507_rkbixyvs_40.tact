struct WeirdOrder {
    s: String?;
    i: Int as uint8;
    b: Bool;
    s2: String;
    i2: Int as int256;
    b2: Bool?;
}

contract MixedOrderPersists {
    f: WeirdOrder;

    init() {
        self.f = WeirdOrder{
            s:null,i:5,b:true,s2:"Y",i2:100,b2:false
        };
    }
}
