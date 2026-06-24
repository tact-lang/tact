struct Inner {
    s: String;
    n: Int;
}

contract Arranged {
    a: Int;
    b: Bool;
    c: Inner;
    d: String;
    e: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = Inner{s: "hi", n: 11};
        self.d = "bye";
        self.e = false;
    }
}