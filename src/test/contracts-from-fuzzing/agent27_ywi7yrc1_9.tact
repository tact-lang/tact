struct BigDeep {
    i: Int;
    j: Bool;
    k: String;
    l: String?;
    m: Int;
    n: Bool;
    o: String;
}

struct Wrapper {
    first: BigDeep;
    second: BigDeep;
}

contract TestBigNest {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            first: BigDeep{
                i: 1, j: false, k: "a", l: null, m: 2, n:true, o:"b"
            },
            second: BigDeep{
                i: 3, j: true, k: "c", l: "d", m:4, n:false, o:"e"
            }
        };
    }
}