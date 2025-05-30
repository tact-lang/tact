struct ABig {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract LotsOfFields {
    f1: ABig;
    f2: ABig;
    f3: ABig;
    
    init() {
        self.f1 = ABig{
            a:1,b:true,c:"a",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),
            g:null,h:null,i:null,j:null,k:null,l:null
        };
        self.f2 = self.f1;
        self.f3 = self.f1;
    }
}