struct BigS {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract TestContract {
    s1: BigS;
    s2: BigS;
    init() {
        self.s1 = BigS{
            a: 10, b: false, c: "foo", d: myAddress(),
            e: 100, f: true, g: null, h: null
        };
        self.s2 = BigS{
            a: 20, b: true, c: "bar", d: myAddress(),
            e: null, f: null, g: "baz", h: myAddress()
        };
    }
    receive() {
        self.s1.a = 1;
    }
}