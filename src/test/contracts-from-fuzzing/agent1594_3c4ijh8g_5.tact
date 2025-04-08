struct WideStruct {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "d";
    e: String = "e";
    f: Bool = false;
    g: Int = 10;
    h: Int = 20;
    i: String = "i";
    j: Bool = false;
    k: Int = -1;
    l: Int = -2;
    m: String = "m";
    n: String = "n";
    o: Bool = true;
    p: Int?;
    q: Bool?;
    r: String?;
    s: Cell?;
    t: Slice?;
    u: Address?;
}

contract TestWide {
    wide: WideStruct;

    init() {
        self.wide = WideStruct{};
    }

    receive() {}
}