struct OuterMost { a: Int; }

contract MixFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    s: OuterMost;
    o: OuterMost?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.s = OuterMost{ a: 5 };
        self.o = null;
    }
}
