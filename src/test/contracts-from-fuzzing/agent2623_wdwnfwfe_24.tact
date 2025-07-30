struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Slice;
    h: Cell;
    i: Slice?;
    j: Cell?;
}

contract TestContract {
    complexField: Complex;

    init() {
        self.complexField = Complex{
            a:1, b:true, c:"str", d:null, e:null, f:null,
            g:emptyCell().asSlice(), h:emptyCell(), i:null, j:null
        };
    }
}