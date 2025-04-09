struct One {
    a: Int;
}

struct Two {
    a: Int;
    b: Int;
}

struct Three {
    a: Int;
    b: Int;
    c: Int;
}

contract AllSizes {
    o: One;
    t: Two;
    th: Three;

    init() {
        self.o = One{a:1};
        self.t = Two{a:2,b:3};
        self.th = Three{a:4,b:5,c:6};
    }
}
