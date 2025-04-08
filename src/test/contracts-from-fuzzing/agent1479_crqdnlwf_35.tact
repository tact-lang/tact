struct HasMany {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Int?;
    f: Bool?;
    g: Address;
    h: Slice;
    i: String?;
    j: Bool;
    k: Int;
}

contract Test {
    m: HasMany;
    init() {
        self.m = HasMany{
            a:1,b:true,c:"x",d:emptyCell(),e:null,f:null,g:myAddress(),h:emptyCell().asSlice(),i:null,j:false,k:99
        };
    }
}