struct One {
    a: Int;
}
struct Two {
    b: Int;
}
contract MultiStructContract {
    s1: One;
    s2: Two;
    init() {
        self.s1 = One{ a: 5 };
        self.s2 = Two{ b: 7 };
    }
}