struct S {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    s: S;
    i: Int = 100;
    s2: S;
    
    init() {
        self.s = S{ a: 10, b: false, c: "foo", d: null, e: true, f: "bar" };
        self.s2 = S{ a: 20, b: true, c: "test", d: 200, e: null, f: null };
    }
    
    receive() {
        self.s.b = false;
    }
}