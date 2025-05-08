struct One {
    f1: Int;
}

struct Two {
    f2: Int;
    f3: Bool;
}

struct Three {
    f4: Int;
    f5: String;
}

contract LotOfFields {
    a: Int;
    b: Bool;
    c: String;
    d: One;
    e: Two;
    f: Three;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "test";
        self.d = One{f1: 1};
        self.e = Two{f2: 2, f3: false};
        self.f = Three{f4: 3, f5: "hi"};
    }
}