struct BigOne {
    a: Int;
    b: String;
    c: Bool;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Slice;
    k: Cell;
    l: Address;
    m: Int;
    n: String;
    o: Bool;
}

contract LargeStructTest {
    payload: BigOne;

    init() {
        self.payload = BigOne{
            a:0,b:"a",c:true,d:emptyCell().asSlice(),e:emptyCell(),f:myAddress(),
            g:null,h:null,i:null,j:emptyCell().asSlice(),k:emptyCell(),l:myAddress(),
            m:1,n:"b",o:false
        };
    }
}