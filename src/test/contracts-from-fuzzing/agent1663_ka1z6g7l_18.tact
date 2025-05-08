struct ManyInts {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

contract IntContract {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    data: ManyInts;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.data = ManyInts{
            a:1, b:2, c:3, d:4, e:5, f:6
        };
    }
}