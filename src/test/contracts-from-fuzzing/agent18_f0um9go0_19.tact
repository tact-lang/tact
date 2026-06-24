struct Reorder {
    a: Int as uint8;
    b: Int;
    c: Bool;
    d: String;
    e: Int as uint32;
    f: String?;
}

contract FieldOrder {
    val: Reorder;
    init() {
        self.val = Reorder{
            a:1,b:2,c:true,d:"hi",e:5,f:null
        };
    }
}
