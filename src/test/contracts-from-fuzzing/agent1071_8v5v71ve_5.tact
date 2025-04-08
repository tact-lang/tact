struct S1 {
    n: Int = 1;
}

struct S2 {
    o: S1?;
}

contract Test6 {
    data: S2 = S2{ o: null };

    init() {
        self.data = S2{ o: S1{ n: 42 } };
    }
}