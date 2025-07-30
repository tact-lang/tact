struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract EverythingInOneField {
    field: Complex;

    init() {
        self.field = Complex{
            a:1, b:false, c:"abc", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
            g:null, h:true, i:null, j:null, k:null, l:null
        };
    }
}