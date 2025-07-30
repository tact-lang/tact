contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: String = "hello";
    e: Int = -1;
    f: Bool = false;
    g: Address;
    h: String = "world";
    i: Int = 1234;
    j: Bool = true;
    k: Address;
    l: String = "test";
    m: Int = -1234;
    n: Bool = false;
    o: Address;
    p: String = "abc";
    q: Int = 0;
    r: Bool = true;
    s: Address;
    t: String = "zzz";
    
    init() {
        self.c = myAddress();
        self.g = myAddress();
        self.k = myAddress();
        self.o = myAddress();
        self.s = myAddress();
    }
}