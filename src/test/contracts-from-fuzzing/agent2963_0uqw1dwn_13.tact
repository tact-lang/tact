struct HasStringsBoolsInts {
    x: Int;
    y: Bool;
    z: String;
}

contract ManyDifferentFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: HasStringsBoolsInts;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = 2;
        self.e = null;
        self.f = "def";
        self.g = HasStringsBoolsInts{
            x: 3,
            y: false,
            z: "ghi"
        };
    }
}
