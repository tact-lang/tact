struct Small {
    a: Int;
}

struct Medium {
    a: Int;
    s: Small;
}

struct Large {
    a: Int;
    m: Medium;
}

contract DeepNestInit {
    huge: Large;
    init() {
        self.huge = Large{
            a: 1,
            m: Medium{
                a: 2,
                s: Small{a:3}
            }
        };
    }
}