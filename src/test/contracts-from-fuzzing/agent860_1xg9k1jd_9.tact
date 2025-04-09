struct Small {
    v: Int;
}

struct Mid {
    s1: Small;
    s2: Small;
    s3: Small;
    opt: Small?;
}

struct Large {
    m1: Mid;
    m2: Mid;
    m3: Mid;
    optm: Mid?;
}

contract NestedStructs {
    storage: Large;

    init() {
        self.storage = Large{
            m1: Mid{ s1: Small{v:1}, s2: Small{v:2}, s3: Small{v:3}, opt: null },
            m2: Mid{ s1: Small{v:4}, s2: Small{v:5}, s3: Small{v:6}, opt: null },
            m3: Mid{ s1: Small{v:7}, s2: Small{v:8}, s3: Small{v:9}, opt: null },
            optm: null
        };
    }
}