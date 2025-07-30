struct WideStruct {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: String;
    f: Address;
    g: Bool?;
    h: Cell?;
    i: Int?;
    j: String?;
    k: Address?;
    l: Slice?;
}

contract WideContract {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            a:1,b:true,c:emptyCell().asSlice(),d:emptyCell(),e:"hi",f:myAddress(),
            g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
}