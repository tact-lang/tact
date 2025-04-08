contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: Bool?;
    d: String = "a";
    e: String?;
    f: Int = 2;
    g: Bool = false;
    h: Int?;
    i: String?;
    j: Bool?;
    k: Int = 3;
    l: Bool = false;
    m: Int?;
    n: String?;
    o: Bool?;

    init() {
        self.h = 100;
        self.e = "x";
        self.i = "y";
        self.j = true;
        self.m = 200;
    }

    receive() {
        let _ = self.k + 1;
    }
}