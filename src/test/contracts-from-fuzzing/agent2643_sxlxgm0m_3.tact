struct DeepWideStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    g: Int;
    h: Bool;
    i: Cell;
    j: Slice;
    k: String;
    l: Address;
    m: Int;
    n: Bool;
    o: Cell;
    p: Slice;
    q: String;
    r: Address;
    s: Int;
    t: Bool;
}

contract WideTest {
    big: DeepWideStruct;

    init() {
        self.big = DeepWideStruct{
            a:1,b:true,c:emptyCell(),d:emptyCell().asSlice(),e:"hi",f:myAddress(),
            g:2,h:false,i:emptyCell(),j:emptyCell().asSlice(),k:"x",l:myAddress(),
            m:3,n:true,o:emptyCell(),p:emptyCell().asSlice(),q:"y",r:myAddress(),
            s:4,t:false
        };
    }
}
