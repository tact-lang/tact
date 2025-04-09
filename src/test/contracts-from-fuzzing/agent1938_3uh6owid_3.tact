struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Address;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Int?;
    k: Cell?;
    l: Slice?;
    m: Address?;
    n: Bool?;
    o: String?;
}

contract ManyFieldsTest {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1,b:2,c:3,d:true,e:"hi",f:myAddress(),g:emptyCell(),h:emptyCell().asSlice(),i:beginCell(),
            j:null,k:null,l:null,m:null,n:null,o:null
        };
    }
}