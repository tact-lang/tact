struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
}

contract ComplexSingleStruct {
    s: S;

    init() {
        self.s = S{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"hi",
            g:1, h:true, i:myAddress(), j:emptyCell(), k:emptyCell().asSlice(), l:"ho"
        };
    }
}