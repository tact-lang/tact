struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    m: Inner;
    n: Inner;
    o: Int;
}

struct Wrapper {
    out: Outer;
    p: Int?;
}

contract TripleNest {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            out: Outer{
                m: Inner{x:1, y:null},
                n: Inner{x:2, y:3},
                o:4
            },
            p: null
        };
    }
}