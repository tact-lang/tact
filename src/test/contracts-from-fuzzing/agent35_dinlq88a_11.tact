struct Mid {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract TestContract {
    a: Mid;
    b: Mid;
    c: Mid;
    d: Mid;
    e: Mid;

    init() {
        self.a = Mid{ f1: 1, f2: true, f3: "one" };
        self.b = Mid{ f1: 2, f2: false, f3: "two" };
        self.c = Mid{ f1: 3, f2: true, f3: "three" };
        self.d = Mid{ f1: 4, f2: false, f3: "four" };
        self.e = Mid{ f1: 5, f2: true, f3: "five" };
    }
}