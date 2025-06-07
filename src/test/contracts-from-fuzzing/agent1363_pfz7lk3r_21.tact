struct ManyOptionalPrimitives {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Address?;
    g: Address?;
    h: Cell?;
    i: Cell?;
}

contract ManyOptionalVals {
    data: ManyOptionalPrimitives;

    init() {
        self.data = ManyOptionalPrimitives{
            a:null,b:null,c:null,d:null,e:true,f:null,g:myAddress(),h:null,i:emptyCell(),
        };
    }
}