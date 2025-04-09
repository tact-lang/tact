struct Inner {
    s: String;
}

contract TestContract {
    a: Int;
    b: Bool;
    c: Inner;

    init() {
        self.a = 5;
        self.b = false;
        self.c = Inner{s: "xx"};
    }
}