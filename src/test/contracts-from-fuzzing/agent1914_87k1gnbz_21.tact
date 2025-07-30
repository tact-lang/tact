struct MixDeep {
    a: Int;
    b: Mid?;
}

struct Mid {
    c: Int;
    d: Leaf?;
}

struct Leaf {
    e: Int;
}

contract TestContract {
    m: MixDeep;

    init() {
        self.m = MixDeep{
            a: 1,
            b: Mid{
                c: 2,
                d: Leaf{ e:3 }
            }
        };
    }
}