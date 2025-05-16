struct Wide {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int;
    h: Bool;
    i: Address;
    j: Cell;
    k: Slice;
    l: String;
    m: Int;
    n: Bool;
    o: Address;
    p: Cell;
    q: Slice;
    r: String;
}

contract Test {
    wide: Wide;

    init() {
        self.wide = Wide{
            a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"1",
            g:2, h:false, i:myAddress(), j:emptyCell(), k:emptyCell().asSlice(), l:"2",
            m:3, n:true, o:myAddress(), p:emptyCell(), q:emptyCell().asSlice(), r:"3"
        };
    }
}
