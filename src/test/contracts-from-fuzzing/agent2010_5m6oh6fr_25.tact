struct Pair {
    a: Int;
    b: String;
}

contract ManyPairs {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;

    init() {
        self.p1 = Pair{ a:1, b:"a" };
        self.p2 = Pair{ a:2, b:"b" };
        self.p3 = Pair{ a:3, b:"c" };
        self.p4 = Pair{ a:4, b:"d" };
    }
}