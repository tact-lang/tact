struct S1 {
    a: Int?;
    b: Int;
}

struct S2 {
    s1: S1?;
    flag: Bool;
}

contract TestContract {
    storage: S2;

    init() {
        self.storage = S2{
            s1: null,
            flag: false
        };
    }
}