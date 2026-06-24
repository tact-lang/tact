struct BigStruct {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Int;
    f: String;
    g: Bool;
}

contract BigPersistent {
    s1: BigStruct;
    s2: BigStruct;
    s3: BigStruct;

    init() {
        self.s1 = BigStruct{ a: 1, b: "b1", c: true, d: myAddress(), e: 2, f: "f1", g: false };
        self.s2 = BigStruct{ a: 3, b: "b2", c: false, d: myAddress(), e: 4, f: "f2", g: true };
        self.s3 = BigStruct{ a: 5, b: "b3", c: true, d: myAddress(), e: 6, f: "f3", g: false };
    }
}