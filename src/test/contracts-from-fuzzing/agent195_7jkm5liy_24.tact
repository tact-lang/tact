struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract OptDefault {
    n: Nested;
    opti: Int?;
    flag: Bool?;

    init() {
        self.n = Nested{ a: 7, b:true, c:null };
        self.opti = null;
        self.flag = null;
    }
}
