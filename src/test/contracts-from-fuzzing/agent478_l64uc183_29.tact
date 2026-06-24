struct WideMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Slice;
    h: Slice?;
    i: Cell;
    j: Cell?;
}

contract ManyMix {
    val: WideMix;
    init() {
        self.val = WideMix{
            a:1, b:null, c:true, d:null, e:"", f:null,
            g: beginCell().endCell().asSlice(),
            h: null,
            i: emptyCell(),
            j: null
        };
    }
}