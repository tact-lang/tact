struct Mixed {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: String?;
    j: Bool?;
}

contract MixedFields {
    s: Mixed;

    init() {
        self.s = Mixed{
            a:1,b:"x",c:true,d:myAddress(),e:emptyCell(),
            f:emptyCell().asSlice(),g:beginCell(),
            h:null,i:null,j:null
        };
    }
}
