struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    c: String?;
}

contract TestContract {
    storage: S2;
    init() {
        self.storage = S2{
            s1: S1{ a: 5, b: true },
            c: null
        };
    }
}