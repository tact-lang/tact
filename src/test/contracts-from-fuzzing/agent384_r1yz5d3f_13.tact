struct Ordered {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract OrderedFields {
    data: Ordered;
    init() {
        self.data = Ordered{
            a:1, b:true, c:"hi", d:myAddress(), 
            e:emptyCell(), f:emptyCell().asSlice(), g:beginCell()
        };
    }
}