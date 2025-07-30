struct MixedOrder {
    a: Int;
    b: Bool?;
    c: Bool;
    d: Int?;
}

contract OrderTest {
    rec: MixedOrder;

    init() {
        self.rec = MixedOrder{
            a:1,b:null,c:true,d:null
        };
    }
}