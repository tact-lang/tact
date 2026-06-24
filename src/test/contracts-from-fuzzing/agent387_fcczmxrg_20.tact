struct Wide {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Int? = null;
    l: Bool = true;
    m: String = "x";
    n: Address? = null;
    o: String? = "w";
}

contract WideStruct {
    big: Wide;

    init() {
        self.big = Wide{
            a: 1,
            b: 2,
            c: false,
            // d omitted, default null
            e: "hi",
            // f omitted, default null
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: emptyCell().asSlice()
            // k omitted, has = null
            // l omitted, = true
            // m omitted, = "x"
            // n omitted, = null
            // o omitted, = "w"
        };
    }
}