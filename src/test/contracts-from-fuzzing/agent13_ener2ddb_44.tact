struct One {
    a: Int;
}
struct Two {
    b: Int;
}
struct Three {
    c: Int;
}
struct Four {
    d: Int;
}

contract ManyStructFields {
    f1: One;
    f2: Two;
    f3: Three;
    f4: Four;

    init() {
        self.f1 = One{a:1};
        self.f2 = Two{b:2};
        self.f3 = Three{c:3};
        self.f4 = Four{d:4};
    }
}