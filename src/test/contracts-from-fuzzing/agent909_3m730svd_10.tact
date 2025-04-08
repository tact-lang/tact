struct A { a: Int; }
struct B { b: Bool; }
struct C { c: Int?; }
struct D { d: Bool?; }
struct E { e: Int as uint8; }
struct F { f: Int as int64; }
struct G { g: Bool; }
struct H { h: Int?; }
struct I { i: Bool?; }
struct J { j: Int; }

struct Wide {
    aa: A;
    bb: B;
    cc: C;
    dd: D;
    ee: E;
    ff: F;
    gg: G;
    hh: H;
    ii: I;
    jj: J;
}

contract WideNested {
    big: Wide;

    init() {
        self.big = Wide{
            aa: A{a:1},
            bb: B{b:true},
            cc: C{c:null},
            dd: D{d:false},
            ee: E{e:5},
            ff: F{f:6},
            gg: G{g:true},
            hh: H{h:null},
            ii: I{i:true},
            jj: J{j:10},
        };
    }
}