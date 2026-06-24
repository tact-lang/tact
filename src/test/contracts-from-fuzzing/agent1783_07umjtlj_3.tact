contract ManyFields {
    foo: Int;
    bar: Bool;
    baz: Address;
    text: String;
    sl: Slice;
    i2: Int;
    b2: Bool;
    a2: Address;
    t2: String;
    s2: Slice;
    i3: Int;
    b3: Bool;
    a3: Address;
    t3: String;
    s3: Slice;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = myAddress();
        self.text = "Hello";
        self.sl = emptyCell().asSlice();
        self.i2 = 2;
        self.b2 = false;
        self.a2 = myAddress();
        self.t2 = "World";
        self.s2 = emptyCell().asSlice();
        self.i3 = 3;
        self.b3 = true;
        self.a3 = myAddress();
        self.t3 = "!";
        self.s3 = emptyCell().asSlice();
    }

    receive() {
        let _ = self.foo + self.i2 + self.i3;
        let _ = self.bar && self.b2 && self.b3;
        let _ = self.text;
        let _ = self.t2;
        let _ = self.t3;
        let _ = self.baz;
        let _ = self.sl;
        let _ = self.a2;
        let _ = self.s2;
        let _ = self.a3;
        let _ = self.s3;
    }
}