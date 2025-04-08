// Compose large nest of optional and remaining suffixes
struct LeafRem {
    suf: Slice as remaining;
}

struct MidLevel {
    a: LeafRem?;
    b: LeafRem?;
}

struct Top {
    m1: MidLevel;
    m2: MidLevel;
}

contract ComplexDeep {
    data: Top;

    init() {
        self.data = Top{
            m1: MidLevel{ a:null, b:null },
            m2: MidLevel{ a:null, b:null }
        };
    }
}
