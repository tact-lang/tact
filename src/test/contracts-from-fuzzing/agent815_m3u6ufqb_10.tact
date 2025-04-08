struct LongTuple {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: String?;
    j: Bool?;
}

contract TupleFields {
    data: LongTuple;

    init() {
        self.data = LongTuple{
            a:1,b:true,c:"s",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),g:beginCell(),h:null,i:null,j:null
        };
    }
}