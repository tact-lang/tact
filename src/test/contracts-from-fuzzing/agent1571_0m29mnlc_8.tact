struct Info {
    data: String;
}

contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int = 0;
    e: String = "hi";
    f: Bool = true;
    nested: Info = Info{ data: "" };

    init() {
        self.a = 2;
        self.b = true;
        self.c = "x";
        self.d = 3;
        self.e = "y";
        self.f = false;
        self.nested = Info{ data: "zzz" };
    }
}