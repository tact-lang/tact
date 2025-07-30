struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: Int?;
    i: Bool;
    j: Int;
}

contract ManyFieldsContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a:1,b:true,c:"hi",d:emptyCell(),e:emptyCell().asSlice(),
            f:myAddress(),g:false,h:2,i:true,j:3
        };
    }
}