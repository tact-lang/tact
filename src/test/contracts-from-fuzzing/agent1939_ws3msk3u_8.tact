struct A1 {
    a: Int?;
    b: Bool?;
}

struct A2 {
    c: String?;
    d: Int?;
}

contract TestContract {
    s1: A1?;
    s2: A2?;
    init() {
        self.s1 = null;
        self.s2 = A2{ c: null, d: 10 };
    }
}