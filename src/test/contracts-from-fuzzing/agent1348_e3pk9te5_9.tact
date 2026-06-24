struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Int?;
    f: Bool?;
    g: Slice?;
    h: String;
    i: String?;
    j: Cell;
    k: Cell?;
    l: Address?;
    m: Int; 
    n: Bool; 
    o: Slice;
}

contract MultiFieldTest {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a:1,b:true,c:myAddress(),d:emptyCell().asSlice(),e:2,
            f:false,g:null,h:"hi",i:null,j:emptyCell(),
            k:null,l:null,m:9,n:false,o:emptyCell().asSlice()
        };
    }
}