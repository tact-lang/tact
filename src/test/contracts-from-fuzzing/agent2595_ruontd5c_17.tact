struct Reordered {
    n: Int as uint256;
    m: Bool;
    l: Int as uint128;
    k: Bool;
    j: Int as uint64;
    i: Bool;
    h: Int as uint32;
    g: Bool;
    f: Int as uint16;
    e: Bool;
    d: Int as uint8;
    c: Bool;
    b: Bool;
    a: Bool;
}

contract ReorderStorage {
    stuff: Reordered;

    init() {
        self.stuff = Reordered{
            n:1,m:true,l:2,k:false,j:3,i:true,h:4,g:false,f:5,e:true,d:6,c:false,b:true,a:false
        };
    }
}