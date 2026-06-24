struct LargeOptionalStruct {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Cell?;
    q: Slice?;
    r: Address?;
}

contract LargeOptionalContract {
    data: LargeOptionalStruct;

    init() {
        self.data = LargeOptionalStruct{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null,
            k:null,l:null,m:null,n:null,o:null,p:null,q:null,r:null
        };
    }
}