struct Small {
    a: Int;
}

struct Big {
    f1: Small;
    f2: Small;
    f3: Small;
    f4: Small;
    f5: Small;
    f6: Small;
    f7: Small;
    f8: Small;
    f9: Small;
    f10: Small;
}

contract ManyNestedSameStructs {
    data: Big;

    init() {
        self.data = Big{
            f1: Small{a:1}, f2: Small{a:2}, f3: Small{a:3}, f4: Small{a:4}, f5: Small{a:5},
            f6: Small{a:6}, f7: Small{a:7}, f8: Small{a:8}, f9: Small{a:9}, f10: Small{a:10}
        };
    }
}