struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Int?;
    j: Bool?;
    k: String;
    l: String;
    m: Cell;
    n: Slice;
    o: Address;
    p: Cell?;
    q: Address?;
    r: Slice?;
    s: String?;
}

contract Tester {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a:1, b:2, c:3, d:4, e:5,
            f:true, g:false, h:true,
            i:42, j:true, k:"A", l:"B",
            m: emptyCell(), n: emptyCell().asSlice(), o: myAddress(),
            p: null, q: null, r: null, s: null
        };
    }
}
