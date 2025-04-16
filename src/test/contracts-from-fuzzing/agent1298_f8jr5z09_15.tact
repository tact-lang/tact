struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
    m: Int;
    n: Bool;
    o: String;
    p: Cell;
    q: Slice;
    r: Address;
    s: Int?;
    t: Bool?;
    u: String?;
    v: Cell?;
    w: Slice?;
    x: Address?;
}

contract TestLarge {
    ls: LargeStruct;
    init() {
        self.ls = LargeStruct{
            a:1,b:true,c:"hi",d:emptyCell(),e:emptyCell().asSlice(),f:myAddress(),
            g:null,h:null,i:null,j:null,k:null,l:null,
            m:2,n:false,o:"yo",p:emptyCell(),q:emptyCell().asSlice(),r:myAddress(),
            s:null,t:null,u:null,v:null,w:null,x:null
        };
    }
}