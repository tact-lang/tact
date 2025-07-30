// Large optional chain with complex struct hierarchy

struct Bottom {
    q: Int?;
    r: Bool?;
}

struct Mid {
    m: Bottom?;
    n: Bottom?;
}

struct Top {
    t1: Mid?;
    t2: Mid?;
}

contract TestContract {
    big: Top;

    init() {
        self.big = Top{
            t1: Mid{ m: Bottom{q:null, r:true}, n: null },
            t2: null
        };
    }
}