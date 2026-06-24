struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: String?;
    l: Cell?;
}

contract DiverseStructFields {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:beginCell(),f:emptyCell().asSlice(),
            g:"hi",h:null,i:null,j:null,k:null,l:null
        };
    }
}
