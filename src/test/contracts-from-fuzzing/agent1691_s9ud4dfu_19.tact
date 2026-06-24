struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
}

contract ComplexContract {
    s: Complex;

    init() {
        self.s = Complex{
            a:1, b:null, c:true, d:null, e:"hi", f:null,
            g:emptyCell(), h:null, i:emptyCell().asSlice(), j:null,
            k:myAddress(), l:null
        };
    }
}