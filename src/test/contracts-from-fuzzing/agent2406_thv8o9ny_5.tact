struct ComplexInner {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Builder;
    f: Slice;
    g: String;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract ComplexNestedStorage {
    data: ComplexInner;

    init() {
        self.data = ComplexInner{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:beginCell(), f:emptyCell().asSlice(),
            g:"hi", h:null, i:null, j:null
        };
    }
}