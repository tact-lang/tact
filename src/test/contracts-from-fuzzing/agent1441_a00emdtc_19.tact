struct Small {
    a: Int;
    b: Bool;
}

struct Big {
    x1: Small;
    x2: Small;
    x3: Small;
    x4: Small;
    x5: Small;
    x6: Small;
    x7: Small;
    x8: Small;
}

contract NestedStructMany {
    val: Big;

    init() {
        self.val = Big{
            x1: Small{a:1,b:false},
            x2: Small{a:2,b:true},
            x3: Small{a:3,b:true},
            x4: Small{a:4,b:false},
            x5: Small{a:5,b:true},
            x6: Small{a:6,b:true},
            x7: Small{a:7,b:false},
            x8: Small{a:8,b:true}
        };
    }

    receive() {}
}