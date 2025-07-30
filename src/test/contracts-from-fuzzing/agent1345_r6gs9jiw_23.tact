struct LargeMixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Slice;
    j: Slice?;
    k: Cell;
    l: Cell?;
}

contract LargeMixedFields {
    foo: LargeMixed;

    init() {
        self.foo = LargeMixed{
            a:1,b:true,c:"hi",d:null,e:false,f:null,g:myAddress(),h:null,
            i:emptyCell().asSlice(),j:null,k:emptyCell(),l:null
        };
    }
}