struct S1 {
    a: Int?;
    b: Bool;
}

struct S2 {
    c: S1?;
    d: S1;
}

contract DoubledOpt {
    store: S2;

    init() {
        self.store = S2{
            c:null,
            d:S1{a:null,b:true}
        };
    }
}