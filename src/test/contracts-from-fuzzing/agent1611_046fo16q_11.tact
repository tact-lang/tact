struct SomeFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}
contract Combo {
    s: SomeFields;
    init() {
        self.s = SomeFields{
            a:1,b:true,c:myAddress(),d:"hi",e:emptyCell(),f:emptyCell().asSlice(),
            g:null,h:null,i:null,j:null,k:null,l:null
        };
    }
}
