struct V {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as int8;
    f: Int as int16;
    g: Int as int32;
    h: Int as int64;

    i: Bool;
    j: Bool?;
    k: Address;
    l: Address?;
    m: String;
    n: String?;

    o: Cell;
    p: Cell?;
    q: Slice;
    r: Slice?;
}

contract ManyFieldTypes {
    state: V;

    init() {
        self.state = V{
            a:1,b:2,c:3,d:4,e:-1,f:-2,g:-3,h:-4,
            i:true,j:null,k:myAddress(),l:null,m:"str",n:null,
            o:emptyCell(),p:null,q:emptyCell().asSlice(),r:null
        };
    }
}
