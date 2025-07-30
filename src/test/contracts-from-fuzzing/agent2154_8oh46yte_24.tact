struct WeirdOrder {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
}

contract OrderTest {
    w: WeirdOrder;

    init() {
        self.w = WeirdOrder{
            f:true,e:"e",d:4,c:false,b:"b",a:1
        };
    }
}