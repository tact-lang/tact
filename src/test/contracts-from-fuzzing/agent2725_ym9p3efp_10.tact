struct Inner {
    s: String;
    flag: Bool;
    count: Int;
}

contract LargeArray {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;
    e: Inner;
    f: Inner;
    g: Inner;
    h: Inner;
    i: Inner;
    j: Inner;

    init() {
        let sample = Inner{ s:"ok", flag:true, count:7 };
        self.a = sample;
        self.b = sample;
        self.c = sample;
        self.d = sample;
        self.e = sample;
        self.f = sample;
        self.g = sample;
        self.h = sample;
        self.i = sample;
        self.j = sample;
    }
}