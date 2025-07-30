struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract Test {
    dat: S;

    init() {
        self.dat = S{
            a:1, b:true, c:"str", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(), g:beginCell()
        };
    }
}