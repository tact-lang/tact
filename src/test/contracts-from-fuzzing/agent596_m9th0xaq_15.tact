struct Flattened {
    aa: Int;
    bb: Int;
    cc: Int;
    dd: Int;
    ee: Int;
    ff: Int;
    gg: Int;
    hh: Int;
    ii: Int;
    jj: Int;
    kk: Int;
    ll: Int;
    mm: Int;
    nn: Int;
    oo: Int;
    pp: Int;
}

contract ManyInts {
    dat: Flattened;

    init() {
        self.dat = Flattened{
            aa:1,bb:2,cc:3,dd:4,ee:5,ff:6,gg:7,hh:8,
            ii:9,jj:10,kk:11,ll:12,mm:13,nn:14,oo:15,pp:16
        };
    }
}