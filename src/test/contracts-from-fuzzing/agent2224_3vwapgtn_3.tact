struct BigFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Bool;
    l: Bool;
    m: Bool;
    n: String;
    o: Slice;
    p: Cell;
    q: Address;
}

contract Test3 {
    big: BigFields;
    init() {
        self.big = BigFields{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:true,l:false,m:true,n:"a",o:emptyCell().asSlice(),
            p:emptyCell(),q:myAddress()
        };
    }
}