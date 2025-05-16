struct Deep1 {
    a: Int;
}

struct Deep2 {
    b: Deep1;
}

struct Deep3 {
    c: Deep2;
}

struct Deep4 {
    d: Deep3;
}

struct Deep5 {
    e: Deep4;
}

struct Deep6 {
    f: Deep5;
}

struct Deep7 {
    g: Deep6;
}

struct Deep8 {
    h: Deep7;
}

contract VeryDeep {
    root: Deep8;

    init() {
        self.root = Deep8{
            h: Deep7{
                g: Deep6{
                    f: Deep5{
                        e: Deep4{
                            d: Deep3{
                                c: Deep2{
                                    b: Deep1{ a: 555 }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}