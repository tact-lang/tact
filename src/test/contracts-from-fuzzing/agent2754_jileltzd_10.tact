struct Small {
    x: Int;
}

struct Big {
    s1: Small;
    s2: Small;
    s3: Small;
    s4: Small;
    s5: Small;
    s6: Small;
    s7: Small;
    s8: Small;
    s9: Small;
    s10: Small;
    s11: Small;
    s12: Small;
    s13: Small;
    s14: Small;
    s15: Small;
}

contract HugeNestedStruct {
    bigOne: Big;

    init() {
        self.bigOne = Big{
            s1: Small{ x:1 }, s2: Small{ x:2 }, s3: Small{ x:3 },
            s4: Small{ x:4 }, s5: Small{ x:5 }, s6: Small{ x:6 },
            s7: Small{ x:7 }, s8: Small{ x:8 }, s9: Small{ x:9 },
            s10: Small{ x:10 }, s11: Small{ x:11 }, s12: Small{ x:12 },
            s13: Small{ x:13 }, s14: Small{ x:14 }, s15: Small{ x:15 }
        };
    }
}
