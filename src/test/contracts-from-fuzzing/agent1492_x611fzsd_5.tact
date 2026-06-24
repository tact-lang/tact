struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Inner;
    h: Inner;
    i: Inner;
    j: Inner;
    k: Inner;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hello";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = Inner{x: 1, y: true, z: "A"};
        self.h = Inner{x: 2, y: false, z: "B"};
        self.i = Inner{x: 3, y: true, z: "C"};
        self.j = Inner{x: 4, y: false, z: "D"};
        self.k = Inner{x: 5, y: true, z: "E"};
    }
}