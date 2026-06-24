struct LongOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Bool;
    g: Address;
    h: Int;
    i: String;
    j: Slice;
    k: Cell;
}

contract OrderedFields {
    s: LongOrder;

    init() {
        self.s = LongOrder{
            a:1,b:true,c:"X",d:emptyCell(),e:emptyCell().asSlice(),
            f:false,g:myAddress(),h:8,i:"Y",j:emptyCell().asSlice(),k:emptyCell()
        };
    }
}
