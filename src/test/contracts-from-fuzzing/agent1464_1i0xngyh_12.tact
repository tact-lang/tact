struct LongFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool?;
    f: String;
    g: String?;
    h: Cell;
    i: Cell?;
    j: Slice;
    k: Slice?;
    l: Address;
    m: Address?;
}

contract LongTest {
    field: LongFields;

    init() {
        self.field = LongFields{
            a:1,b:2,c:3,d:true,e:null,f:"f",g:null,h:emptyCell(),i:null,j:emptyCell().asSlice(),k:null,l:myAddress(),m:null
        };
    }
}
