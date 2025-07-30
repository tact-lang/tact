struct ManyTypes {
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
}

contract StructManyTypesContract {
    data: ManyTypes;
    
    init() {
        self.data = ManyTypes{
            a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
            g:beginCell(), h:null, i:null, j:"ok", k:null
        };
    }
}