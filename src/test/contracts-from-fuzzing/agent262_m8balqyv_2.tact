struct Deep {
    x: Int;
    y: Bool;
    z: String;
    q: Slice?;
}

struct Mid {
    d1: Deep;
    d2: Deep?;
    txt: String?;
}

struct Top {
    m1: Mid;
    m2: Mid?;
    extra: Int;
}

contract MultiLayered {
    state: Top;

    init() {
        self.state = Top{
            m1: Mid{
                d1: Deep{x:1, y:true, z:"x", q:null},
                d2: null,
                txt:null
            },
            m2: null,
            extra: 0
        };
    }
}
