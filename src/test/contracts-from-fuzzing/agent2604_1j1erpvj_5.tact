struct DeepWide {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Bool;
    g: Int;
    h: String;
    i: Slice;
    j: Cell;
    k: Int?;
    l: Bool?;
    m: String?;
    n: Slice?;
    o: Cell?;
}

contract ComplexFields {
    x: DeepWide;

    init() {
        self.x = DeepWide{
            a:1, b:true, c:"c", d:emptyCell().asSlice(), e:emptyCell(),
            f:false, g:7, h:"h", i:emptyCell().asSlice(), j:emptyCell(),
            k:null, l:null, m:null, n:null, o:null
        };
    }
}