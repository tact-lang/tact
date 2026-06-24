struct NestedLots {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Builder;
    f: Address;
    g: String;
    h: Int?;
}

contract NestedLotsField {
    s: NestedLots;
    init() {
        self.s = NestedLots{
            a:1,b:true,c:emptyCell(),d:emptyCell().asSlice(),e:beginCell(),f:myAddress(),g:"s",h:null
        };
    }
}