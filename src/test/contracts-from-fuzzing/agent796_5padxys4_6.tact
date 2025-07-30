struct S1 {
    a: Int = 1;
    b: Int?;
}

struct S2 {
    s: S1;
    opt: Int?;
}

contract Test {
    data: S2;
    init() {
        self.data = S2{
            s: S1{ a:5, b:null },
            opt: null
        };
    }
}