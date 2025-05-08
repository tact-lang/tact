struct AA {
    a: Int;
}

struct BB {
    b: Int;
    aa: AA;
}

struct CC {
    c: Int;
    bb: BB;
}

struct DD {
    d: Int;
    cc: CC;
}

contract ManyNestings {
    val: DD = DD{
        d: 9,
        cc: CC{
            c: 8,
            bb: BB{
                b:7,
                aa: AA{ a:6 }
            }
        }
    };

    init() {
        self.val = DD{
            d: 99,
            cc: CC{
                c: 88,
                bb: BB{
                    b:77,
                    aa: AA{ a:66 }
                }
            }
        };
    }
}