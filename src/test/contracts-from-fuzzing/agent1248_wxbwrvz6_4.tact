struct LongStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell?;
    j: Slice?;
    k: Int;
    l: Int?;
    m: Bool;
    n: Bool?;
    o: String;
    p: String?;
    q: Address;
    r: Address?;
    s: Cell?;
    t: Slice?;
}

contract WideFields {
    state: LongStruct;

    init() {
        self.state = LongStruct{
            a: 1, b: null, c: true, d: false,
            e: "hi", f: null, g: myAddress(), h: null,
            i: null, j: null, k: 2, l: null,
            m: false, n: null, o: "bye", p: null,
            q: myAddress(), r: null, s: null, t: null
        };
    }
}
