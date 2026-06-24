struct Tiny { f: Int }

struct Mid {
    a: Tiny; 
    b: Tiny?;
}

struct Big {
    m: Mid; 
    mOpt: Mid?;
}

contract OptDeepTree {
    data: Big;

    init() {
        self.data = Big{
            m: Mid{ a: Tiny{f:1}, b: null },
            mOpt: null
        };
    }
}