struct A {
 a: Int = 1;
}

struct B {
 b: Int = 2;
}

struct C {
 c: Int = 3;
}

struct D {
 d: Int = 4;
}

struct E {
 e: Int = 5;
}

struct F {
 f: Int = 6;
}

struct ABCDEF {
    sa: A;
    sb: B;
    sc: C;
    sd: D;
    se: E;
    sf: F;
}

contract ManyNestedKinds {
    nest: ABCDEF = ABCDEF{
        sa: A{a: 100},
        sb: B{b: 101},
        sc: C{c: 102},
        sd: D{d: 103},
        se: E{e: 104},
        sf: F{f: 105}
    };
    receive() {
        self.nest = ABCDEF{
            sa: A{a: 200},
            sb: B{b: 201},
            sc: C{c: 202},
            sd: D{d: 203},
            se: E{e: 204},
            sf: F{f: 205}
        };
    }
}