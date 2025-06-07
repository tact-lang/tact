struct SNested {
    foo: Int;
    bar: Bool;
    text: String;
}

contract ManyMixedFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: SNested;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "hello";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = SNested{foo: 1, bar: false, text: ""};
    }
}