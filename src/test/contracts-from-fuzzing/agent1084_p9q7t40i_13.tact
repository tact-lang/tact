struct S1 {
    a: Int = 1;
}

struct S2 {
    b: Int = 2;
}

contract TestContract {
    v1: S1;
    v2: S2;
    init() {
        self.v1 = S1{};
        self.v2 = S2{};
    }
    receive() {}
}