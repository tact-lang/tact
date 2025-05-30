struct S1 {
    a: Int?;
    b: Bool?;
}

struct S2 {
    c: S1?;
}

contract TestContract {
    data: S2;
    init() {
        self.data = S2{
            c: S1{ a: -5, b: null }
        };
    }
}