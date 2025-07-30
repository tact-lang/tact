struct Large {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;
    f: Slice;
    g: Int;
    h: Bool;
    i: Cell;
    j: Address;
    k: String;
    l: Slice;
    m: Int;
    n: Bool;
    o: Cell;
    p: Address;
    q: String;
    r: Slice;
    s: Int;
    t: Bool;
}

contract LargeStructContract {
    big: Large;

    init() {
        self.big = Large{
            a:1,b:true,c:emptyCell(),d:myAddress(),e:"e",f:emptyCell().asSlice(),
            g:2,h:false,i:emptyCell(),j:myAddress(),k:"k",l:emptyCell().asSlice(),
            m:3,n:true,o:emptyCell(),p:myAddress(),q:"q",r:emptyCell().asSlice(),
            s:4,t:false
        };
    }
}