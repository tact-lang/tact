struct Sub {
    field1: Int;
    field2: Bool;
}

contract Test {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: Sub;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "ok";
        self.d = null;
        self.e = false;
        self.f = Sub{ field1: 7, field2: false };
    }
}
