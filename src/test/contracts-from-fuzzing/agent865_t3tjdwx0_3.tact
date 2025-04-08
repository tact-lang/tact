struct ManyFields {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
    k: Int = 11;
    l: Int = 12;
    m: Int = 13;
    n: Int = 14;
    o: Int = 15;
    p: Int = 16;
    q: Int = 17;
    r: Int = 18;
    s: Int = 19;
    t: Int = 20;
}

contract WideStruct {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 100,
            b: 101,
            c: 102,
            d: 103,
            e: 104,
            f: 105,
            g: 106,
            h: 107,
            i: 108,
            j: 109,
            k: 110,
            l: 111,
            m: 112,
            n: 113,
            o: 114,
            p: 115,
            q: 116,
            r: 117,
            s: 118,
            t: 119,
        };
    }
}
