contract TestContract {
    foo: Int; bar: Int; baz: Int; qux: Int;
    a: Bool; b: Bool; c: Bool; d: Bool;
    s1: String; s2: String; s3: String; s4: String;
    addr1: Address; addr2: Address; addr3: Address; addr4: Address;

    init() {
        self.foo = 1; self.bar = 2; self.baz = 3; self.qux = 4;
        self.a = true; self.b = false; self.c = true; self.d = false;
        self.s1 = "one"; self.s2 = "two"; self.s3 = "three"; self.s4 = "four";
        self.addr1 = myAddress(); self.addr2 = myAddress();
        self.addr3 = myAddress(); self.addr4 = myAddress();
    }
}