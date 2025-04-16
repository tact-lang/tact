contract ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    s: SmallStruct;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = true;
        self.s = SmallStruct{x:42};
    }
}

struct SmallStruct {
    x: Int;
}
