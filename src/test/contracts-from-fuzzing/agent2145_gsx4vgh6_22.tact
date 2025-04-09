struct StrangeOrder {
    a: Bool;
    b: Int as uint64;
    c: String;
    d: Int;
    e: Bool?;
    f: Int?;
    g: String?;
}

contract StorageTest {
    val: StrangeOrder;

    init() {
        self.val = StrangeOrder{
            a:true,b:123,c:"xxx",d:456,e:null,f:null,g:null
        };
    }
}