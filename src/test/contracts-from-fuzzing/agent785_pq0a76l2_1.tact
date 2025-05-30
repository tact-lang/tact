struct WithLongList {
    aa: Int;
    bb: String;
    cc: Bool;
    dd: Int;
    ee: String;
    ff: Bool;
    gg: Int;
    hh: String;
    ii: Bool;
    jj: Int;
    kk: String;
    ll: Bool;
    mm: Int;
    nn: String;
    oo: Bool;
    pp: Int;
}

contract TestLong {
    item: WithLongList;
    init() {
        self.item = WithLongList{
            aa: 1,
            bb: "b",
            cc: false,
            dd: 4,
            ee: "e",
            ff: true,
            gg: 7,
            hh: "h",
            ii: false,
            jj: 10,
            kk: "k",
            ll: true,
            mm: 13,
            nn: "n",
            oo: false,
            pp: 16
        };
    }
}
