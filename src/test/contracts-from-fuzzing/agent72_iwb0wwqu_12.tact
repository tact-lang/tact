struct TenFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Address;
    e: String;
    f: Bool?;
    g: Int?;
    h: Int;
    i: Int;
    j: String;
}

contract StructWithStruct {
    stored: TenFields;

    init() {
        self.stored = TenFields{
            a:1,b:2,c:true,d:myAddress(),e:"hi",
            f:null, g:null, h:3, i:4, j:"bye"
        };
    }
}