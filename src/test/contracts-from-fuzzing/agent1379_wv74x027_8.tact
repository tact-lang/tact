struct BigOuter {
    s1: Small;
    s2: Small;
    s3: Small;
    s4: Small;
}

struct Small {
    a: Int;
    b: Bool;
}

contract WithBigOuter {
    field: BigOuter;

    init() {
        self.field = BigOuter{
            s1: Small{a:1,b:true},
            s2: Small{a:2,b:false},
            s3: Small{a:3,b:true},
            s4: Small{a:4,b:false},
        };
    }
}
