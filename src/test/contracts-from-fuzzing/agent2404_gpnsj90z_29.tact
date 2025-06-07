struct UnusualOrder {
    b: Bool;
    y: Int as uint8;
    x: Int;
    z: String;
    opt: Int?;
    optStr: String?;
}

contract FieldOrder {
    data: UnusualOrder;
    init() {
        self.data = UnusualOrder{b:true,y:7,x:10,z:"q",opt:null,optStr:null};
    }
}