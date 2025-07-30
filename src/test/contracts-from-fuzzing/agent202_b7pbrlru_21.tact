struct Pair {
    a: Int;
    b: Int;
}

struct Wrapper {
    p1: Pair;
    p2: Pair;
    p3: Pair;
}

contract LargeNested {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            p1: Pair{ a:1, b:2 },
            p2: Pair{ a:3, b:4 },
            p3: Pair{ a:5, b:6 }
        };
    }
    receive() {
        let _ = self.w.p1.a + self.w.p2.b + self.w.p3.a;
    }
}