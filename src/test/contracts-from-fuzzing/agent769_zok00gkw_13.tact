struct Inner {
    n: Int;
}

contract ListOfStructs {
    s1: Inner;
    s2: Inner;

    init() {
        self.s1 = Inner{ n: 10 };
        self.s2 = Inner{ n: 20 };
    }

    receive() {
        let _ = self.s1.n + self.s2.n;
    }
}