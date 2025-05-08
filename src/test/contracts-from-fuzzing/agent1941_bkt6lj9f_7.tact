struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    s1_opt: S1?;
}

contract TestContract {
    store: S2;

    init() {
        self.store = S2{
            s1: S1{ a:1, b:true },
            s1_opt: null
        };
    }
}