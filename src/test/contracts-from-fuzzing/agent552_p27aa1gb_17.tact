struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a:1, b:true, c:"x", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress(),
            g:null, h:null, i:null, j:null, k:null, l:null
        };
    }
}