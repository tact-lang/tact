struct MixedOrder {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract FieldOrderTest {
    m: MixedOrder;

    init() {
        self.m = MixedOrder{
            a:1, b:"x", c:true, d:null, e:null, f:null
        };
    }
}