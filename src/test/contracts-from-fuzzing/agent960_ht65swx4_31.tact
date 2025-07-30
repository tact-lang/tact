struct WeirdOrder {
    a: Int?;
    b: Int;
    c: String?;
    d: Bool;
    e: String;
    f: Bool?;
}

contract WeirdFields {
    f: WeirdOrder;
    init() {
        self.f = WeirdOrder{
            a:null,b:1,c:"c",d:true,e:"e",f:null
        };
    }
}