struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
}

contract FullMix {
    field: Complex;

    init() {
        self.field = Complex{
            a:1, b:true, c:null, d:null,
            e:"str", f:null, g:emptyCell(), h:null,
            i:emptyCell().asSlice(), j:null
        };
    }
}
