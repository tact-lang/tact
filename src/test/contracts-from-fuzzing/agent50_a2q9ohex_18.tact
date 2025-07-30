struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;
}

contract LargeVariety {
    varData: LargeStruct;

    init() {
        self.varData = LargeStruct{
            a:1,b:true,c:"c",d:myAddress(),e:emptyCell(),
            f:emptyCell().asSlice(),g:beginCell(),
            h:null,i:null,j:null,k:null,l:null,m:null,n:null
        };
    }
}