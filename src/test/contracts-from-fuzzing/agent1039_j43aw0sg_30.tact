struct S1 {
    n: Int;
    o: Int?;
}

struct S2 {
    inner1: S1;
    inner2: S1;
    optInner: S1?;
}

contract TestContract {
    data: S2;

    init() {
        self.data = S2{
            inner1: S1{n:1,o:null},
            inner2: S1{n:2,o:3},
            optInner: null
        };
    }
}