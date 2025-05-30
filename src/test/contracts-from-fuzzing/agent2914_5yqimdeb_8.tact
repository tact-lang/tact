struct BigFlat {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Cell;
    m: Address;
}

contract LargeFlatStructStorage {
    s: BigFlat;

    init() {
        self.s = BigFlat{
            a:1, b:2, c:true, d:"hi", e:emptyCell(), f:beginCell(),
            g:emptyCell().asSlice(), h:myAddress(), i:3, j:false,
            k:"there", l:emptyCell(), m:myAddress()
        };
    }
}