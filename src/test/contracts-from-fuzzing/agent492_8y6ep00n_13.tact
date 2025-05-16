struct S1 {
    n: Int;
}

struct S2 {
    inner1: S1;
    inner2: S1;
}

contract TestContract {
    data: S2;

    init() {
        self.data = S2{
            inner1: S1{n: 1},
            inner2: S1{n: 2}
        };
    }
}