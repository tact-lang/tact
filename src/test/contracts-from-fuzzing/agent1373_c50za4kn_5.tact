struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int;
    h: Bool;
    i: Address;
    j: Cell;
    k: Slice;
    l: String;
    m: Int;
    n: Bool;
    o: Address;
    p: Cell;
    q: Slice;
    r: String;
    s: Int;
    t: Bool;
}

contract Test {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"A",
            g:2,h:false,i:myAddress(),j:emptyCell(),k:emptyCell().asSlice(),l:"B",
            m:3,n:true,o:myAddress(),p:emptyCell(),q:emptyCell().asSlice(),r:"C",
            s:4,t:false
        };
    }
}