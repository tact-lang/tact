struct StrangeOrder {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OrderTest {
    storage: StrangeOrder;

    init() {
        self.storage = StrangeOrder{
            a:1,b:"s",c:true,d:null,e:null,f:null
        };
    }
}