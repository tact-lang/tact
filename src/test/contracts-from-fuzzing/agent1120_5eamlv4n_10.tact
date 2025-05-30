struct Embedded {
    id: Int;
    flag: Bool;
    comment: String?;
}

contract MultiFields {
    a: Int;
    b: Bool;
    c: String;
    d: String?;
    e: Embedded;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = null;
        self.e = Embedded{ id: 42, flag: false, comment: null };
    }
}