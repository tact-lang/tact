struct Alpha {
    first: Int;
}

struct Beta {
    second: Int;
}

struct Gamma {
    third: Int;
}

contract LongOrder {
    a: Int;
    b: Alpha;
    c: Bool;
    d: Beta;
    e: String;
    f: Gamma;
    g: Int;

    init() {
        self.a = 1;
        self.b = Alpha{first:2};
        self.c = true;
        self.d = Beta{second:3};
        self.e = "hi";
        self.f = Gamma{third:4};
        self.g = 5;
    }
}