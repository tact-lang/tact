struct AA {
    x: Int;
}

struct AB {
    y: Int;
}

struct AC {
    z: Int;
}

contract WideFields {
    a: AA;
    b: AB;
    c: AC;
    d: AA;
    e: AB;
    f: AC;

    init() {
        self.a = AA{x: 1};
        self.b = AB{y: 2};
        self.c = AC{z: 3};
        self.d = AA{x: 4};
        self.e = AB{y: 5};
        self.f = AC{z: 6};
    }
}