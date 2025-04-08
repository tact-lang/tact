struct MixedOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Bool;
    g: Int?;
}

contract TestMixedOrder {
    stat: MixedOrder;
    init() {
        self.stat = MixedOrder{
            a:1,b:true,c:"x",d:null,e:emptyCell(),f:false,g:100
        };
    }
}
