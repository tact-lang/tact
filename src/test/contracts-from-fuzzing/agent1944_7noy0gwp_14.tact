struct WeirdOrder {
    a: Int as uint4;
    b: String;
    c: Bool;
    d: Int;
    e: Address;
    f: Cell;
    g: Slice;
    h: Bool?;
    i: String?;
}

contract UnusualOrder {
    w: WeirdOrder;

    init() {
        self.w = WeirdOrder{
            a:5,b:"x",c:true,d:9,e:myAddress(),f:emptyCell(),g:emptyCell().asSlice(),h:null,i:null
        };
    }
}