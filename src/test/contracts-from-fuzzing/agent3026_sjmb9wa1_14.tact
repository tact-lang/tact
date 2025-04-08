struct Flattened {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: String;
    f: Address;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: String?;
    l: Address?;
}

contract FlatAllTypes {
    storage: Flattened;

    init() {
        self.storage = Flattened{
            a:1,b:true,c:emptyCell(),d:emptyCell().asSlice(),e:"",f:myAddress(),
            g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
}