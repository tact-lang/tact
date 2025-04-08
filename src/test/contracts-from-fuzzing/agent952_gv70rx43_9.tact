struct AA { a: Int; }
struct AB { b: Int; }
struct AC { c: Int; }
struct AD { d: Int; }
struct AE { e: Int; }
struct AF { f: Int; }

struct BIG {
    aa: AA; ab: AB; ac: AC; ad: AD; ae: AE; af: AF;
}

contract BigNested {
    store: BIG;

    init() {
        self.store = BIG{
            aa: AA{a:1}, ab: AB{b:2}, ac: AC{c:3}, ad: AD{d:4}, ae: AE{e:5}, af: AF{f:6}
        };
    }
}
