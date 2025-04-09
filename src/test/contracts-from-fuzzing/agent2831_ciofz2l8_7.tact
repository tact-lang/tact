struct Small {
    a: Int;
}

struct Larger {
    s1: Small;
    s2: Small;
    s3: Small;
    s4: Small;
    s5: Small;
}

contract NestedRepeated {
    val: Larger;

    init() {
        self.val = Larger{
            s1: Small{a:1},
            s2: Small{a:2},
            s3: Small{a:3},
            s4: Small{a:4},
            s5: Small{a:5},
        };
    }
}
